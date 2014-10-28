require 'support/activerecord_helper'

require_relative '../../app/models/item'

describe Item do
  it 'can be created' do
    expect(Item.create(merchant_id: 1, description: 'foo', price: 1.10)).to be_truthy
  end
end
