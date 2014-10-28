require 'support/activerecord_helper'

require_relative '../../app/models/import'

describe Import do
  subject(:import) { Import.new(tsv_data: tsv_data) }

  context 'given valid data' do
    let(:tsv_data)   { File.read(File.expand_path('spec/fixtures/valid_sample.tsv')) }

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

    it 'calculates the gross revenue' do
      import.commit
      expect(import.gross_revenue).to eq 95.0
    end
  end

  context 'given invalid data' do
    let(:tsv_data) { File.read(File.expand_path('spec/fixtures/invalid_sample.tsv')) }

    it 'will rollback on error' do
      import.commit
      expect(Purchase.count).to eq 0
      expect(Merchant.count).to eq 0
      expect(Purchaser.count).to eq 0
      expect(Item.count).to eq 0
    end

    it 'is a failure' do
      import.commit
      expect(import.successful?).to be_falsy
    end
  end

  describe 'unit tests' do
  end
end
