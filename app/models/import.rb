require 'csv'
require_relative 'merchant'

class Import
  def initialize(tsv_data: )
    @tsv_data = tsv_data
  end

  # commit the given data
  # @TODO transaction
  def commit
    CSV.parse(@tsv_data, col_sep: "\t", headers: true) do |row|

      puts row.headers.map { |h| "*#{h}*" }
      merchant = Merchant.find_or_create_by!(name:    row['merchant name'],
                                             address: row['merchant address'])

      # Purchase.create(item_id)
    end

  end

  def parse

  end

end
