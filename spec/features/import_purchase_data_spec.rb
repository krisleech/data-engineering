require 'support/feature_helper'

feature 'importing a CSV file' do
  let(:csv_fixture_path) { File.expand_path('spec/fixtures/valid_sample.tsv')  }

  scenario 'uploading a valid CSV file' do
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
