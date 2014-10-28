describe Import do
  context 'given valid data' do
    let(:tsv_data)   { File.read('../fixtures/valid_sample.tsv') }

    subject(:import) { Import.new(tsv_data: tsv_data) }

    before do
      Purchaser.delete_all
    end

    it 'persists Purchasers to database' do
      expect { import.commit }.to change { Purchaser.count }.by(99)
    end

    it 'is successful' do
      # import.commit
      expect(import.successful?).to be_truthy
    end
  end
end
