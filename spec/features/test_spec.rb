require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

feature 'testing capybara' do
  it 'works' do
    visit root_url
  end
end
