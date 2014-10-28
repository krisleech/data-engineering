require 'support/activerecord_helper'

require_relative '../../app/models/purchase'

describe Purchase do
  it 'can be created' do
    Purchase.create(item_id: 1, purchaser_id: 1, quantity: 1)
  end
end
