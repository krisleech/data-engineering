require 'active_record'

class Merchant < ActiveRecord::Base
  has_many :products
end
