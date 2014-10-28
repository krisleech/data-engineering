require 'active_record'

class Purchase < ActiveRecord::Base
  belongs_to :item

  def gross_revenue
    item.price * quantity
  end
end
