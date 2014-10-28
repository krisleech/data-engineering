require 'active_record'

ActiveRecord::Base.establish_connection(YAML.load_file('config/database.yml')['test'])

RSpec.configure do |config|
  config.before(:each, type: :model) do
    Merchant.delete_all  if defined?(Merchant)
    Item.delete_all      if defined?(Item)
    Purchaser.delete_all if defined?(Purchaser)
    Purchase.delete_all  if defined?(Purchase)
  end
end
