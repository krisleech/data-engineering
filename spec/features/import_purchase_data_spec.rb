require 'support/feature_helper'

feature 'importing a CSV file' do
  let(:csv_fixture_path) { File.expand_path('spec/fixtures/valid_sample.tsv')  }

  scenario 'uploading a valid CSV file' do
    visit root_url
    attach_file('file', csv_fixture_path)
    click_button 'Import'

    expect(page).to have_content('Successfully imported')
  end
end