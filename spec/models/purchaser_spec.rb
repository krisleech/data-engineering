require 'support/activerecord_helper'
require_relative '../../app/models/purchaser'

describe Purchaser do
  it 'can be created' do
    Purchaser.create(name: 'foo')
  end
end
