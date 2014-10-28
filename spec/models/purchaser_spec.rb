require 'support/activerecord_helper'
require_relative '../../app/models/purchaser'

describe Purchaser do
  it 'can be created' do
    expect(Purchaser.create(name: 'foo')).to be_truthy
  end
end
