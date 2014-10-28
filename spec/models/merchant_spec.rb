require 'support/activerecord_helper'
require_relative '../../app/models/merchant'

describe Merchant do
  it 'can be created' do
    expect(Merchant.create(name: 'foo', address: 'bar')).to be_truthy
  end
end
