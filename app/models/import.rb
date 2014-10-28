require 'csv'

require_relative 'merchant'
require_relative 'item'
require_relative 'purchase'

class Import
  def initialize(tsv_data: )
    @tsv_data = tsv_data
    @successful = false
  end

  # commit the given data
  # @TODO transaction
  def commit
    CSV.parse(@tsv_data, col_sep: "\t", headers: true) do |row|

      merchant = Merchant.find_or_create_by!(name:    row['merchant name'],
                                             address: row['merchant address'])

      item = Item.find_or_create_by!(merchant_id: merchant.id,
                                     description: row['item description'],
                                     price:       row['item price'])

      # Purchase.create(item_id)
    end

    @successful = true
  end

  def successful?
    @successful
  end

end
