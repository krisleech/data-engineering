require 'csv'

require_relative 'merchant'
require_relative 'item'
require_relative 'purchase'
require_relative 'purchaser'

class Import
  attr_reader :gross_revenue

  def initialize(tsv_data:)
    @tsv_data   = tsv_data
    @successful = nil
    @gross_revenue = nil
  end

  # commit the data within a transaction
  #
  def commit
    @gross_revenue = 0

    transaction do
      parsed_tsv do |row|

        merchant  = create_merchant(row)
        item      = create_item(row, merchant)
        purchaser = create_purchaser(row)

        purchase  = Purchase.create!(item_id:      item.id,
                                     purchaser_id: purchaser.id,
                                     quantity:     row['purchase count'])
        update_revenue(purchase)
      end
    end

    @successful = true

  rescue ActiveRecord::StatementInvalid
    @successful = false
  end

  def successful?
    @successful
  end

  private

  def update_revenue(purchase)
    @gross_revenue += purchase.gross_revenue
  end

  def parsed_tsv(&block)
    CSV.parse(@tsv_data, col_sep: "\t", headers: true, &block)
  end

  def create_merchant(row)
    Merchant.find_or_create_by!(name:    row['merchant name'],
                                address: row['merchant address'])
  end

  def create_item(row, merchant)
    Item.find_or_create_by!(merchant_id: merchant.id,
                            description: row['item description'],
                            price:       row['item price'])
  end

  def create_purchaser(row)
    Purchaser.find_or_create_by!(name: row['purchaser name'])
  end

  def transaction(&block)
    ActiveRecord::Base.transaction { yield }
  end
end
