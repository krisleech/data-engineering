require 'support/activerecord_helper'
require_relative '../../app/models/merchant'

describe Merchant do
  it 'can be created' do
    Merchant.create(name: 'foo', address: 'bar')
  end
end
