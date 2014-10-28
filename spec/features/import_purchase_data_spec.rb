require 'support/feature_helper'

feature 'importing data' do

  context 'with a valid TSV file' do
    let(:csv_fixture_path) { File.expand_path('spec/fixtures/valid_sample.tsv')  }

    scenario 'successful import' do
      visit root_url
      attach_file('file', csv_fixture_path)
      click_button 'Submit'

      expect(page).to have_content('Import successful')
    end

    scenario 'displays gross revenue' do
      visit root_url
      attach_file('file', csv_fixture_path)
      click_button 'Submit'

      expect(page).to have_content('Gross Revenue 95.0')
    end
  end

  context 'with an invalid tsv file' do
    let(:csv_fixture_path) { File.expand_path('spec/fixtures/invalid_sample.tsv')  }

    scenario 'unsuccessful import' do
      visit root_url
      attach_file('file', csv_fixture_path)
      click_button 'Submit'

      expect(page).to have_content('Import failed')
    end
  end
end
