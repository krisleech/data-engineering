require 'rails_helper'

describe ImportsController do
  describe 'GET #index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
