require 'support/activerecord_helper'

require_relative '../../app/models/import'
require_relative '../../app/models/purchase'

describe Import do
  context 'given valid data' do
    let(:tsv_data)   { File.read(File.expand_path('spec/fixtures/valid_sample.tsv')) }

    subject(:import) { Import.new(tsv_data: tsv_data) }

    before do
      Merchant.delete_all
      Purchase.delete_all
    end

    it 'persists merchants to database' do
      expect { import.commit }.to change { Merchant.count }.by(3)
    end

    it 'is successful' do
      # import.commit
      expect(import.successful?).to be_truthy
    end
  end


  describe 'unit tests' do
  end
end
