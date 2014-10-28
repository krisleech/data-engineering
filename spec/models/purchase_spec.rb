require 'support/activerecord_helper'

require_relative '../../app/models/purchase'
require_relative '../../app/models/item'

describe Purchase do
  it 'can be created' do
    Purchase.create(item_id: 1, purchaser_id: 1, quantity: 1)
  end

  it '.gross_revenue returns gross revenue' do
    item     = Item.new(price: 100.50)
    purchase = Purchase.new(quantity: 10, item: item)

    expect(purchase.gross_revenue).to eq 1005.0
  end
end
