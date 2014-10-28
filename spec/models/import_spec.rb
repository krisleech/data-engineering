require 'support/activerecord_helper'

require_relative '../../app/models/import'

describe Import do
  context 'given valid data' do
    let(:tsv_data)   { File.read(File.expand_path('spec/fixtures/valid_sample.tsv')) }

    subject(:import) { Import.new(tsv_data: tsv_data) }

    before do
      Merchant.delete_all
      Item.delete_all
      Purchaser.delete_all
      Purchase.delete_all
    end

    it 'persists merchants to database' do
      expect { import.commit }.to change { Merchant.count }.by(3)
    end

    it 'persists items to database' do
      expect { import.commit }.to change { Item.count }.by(3)
    end

    it 'persists purchaser to database' do
      expect { import.commit }.to change { Purchaser.count }.by(3)
    end

    it 'persists purchases to database' do
      expect { import.commit }.to change { Purchase.count }.by(4)
    end

    it 'is successful' do
      import.commit
      expect(import.successful?).to be_truthy
    end
  end


  describe 'unit tests' do
  end
end
