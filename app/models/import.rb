require 'csv'

require_relative 'merchant'
require_relative 'item'
require_relative 'purchase'
require_relative 'purchaser'

class Import
  def initialize(tsv_data:)
    @tsv_data = tsv_data
    @successful = nil
  end

  # commit the data within a transaction
  def commit
    transaction do
      CSV.parse(@tsv_data, col_sep: "\t", headers: true) do |row|

        merchant = Merchant.find_or_create_by!(name: row['merchant name'],
                                               address: row['merchant address'])

        item = Item.find_or_create_by!(merchant_id: merchant.id,
                                       description: row['item description'],
                                       price:       row['item price'])

        purchaser = Purchaser.find_or_create_by!(name: row['purchaser name'])

        Purchase.create!(item_id:      item.id,
                         purchaser_id: purchaser.id,
                         quantity:     row['purchase count'])
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

  def transaction(&block)
    ActiveRecord::Base.transaction { yield }
  end
end
