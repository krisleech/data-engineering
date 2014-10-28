require 'rails_helper'

describe ImportsController do
  let(:valid_tvs_path) { File.expand_path('spec/fixtures/valid_sample.tsv') }
  let(:file) { Rack::Test::UploadedFile.new valid_tvs_path, 'text/tab-separated-values' }

  describe 'GET #index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST #create' do
    it 'responds successfully' do
      post :create, file: file
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe 'authentication' do
    after { ENV['AUTH_TOKENS'] = '' }

    it 'requires token set in ENV' do
      ENV['AUTH_TOKENS'] = '1234'
      get :index
      expect(response).to_not be_success
      expect(response).to have_http_status(401)
    end
  end
end
