require 'support/activerecord_helper'

require_relative '../../app/models/item'

describe Item do
  it 'can be created' do
    Item.create(merchant_id: 1, description: 'foo', price: 1.10)
  end
end
