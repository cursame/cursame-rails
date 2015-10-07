require 'rails_helper'

RSpec.describe Catalog, type: :catalog_model do

  scenario 'it creates a valid model'  do
    catalog = FactoryGirl.build(:catalog, csv_file: self.prepare_file("valid.csv"))
    expect(catalog).to be_valid
  end

  shared_examples 'it tries to create an invalid model' do |field, error_message, attributtes = {}|

    it "should have and invalid #{field} with error: #{error_message}" do
      catalog = FactoryGirl.build(:catalog, status: attributtes[:status],
                                  csv_file: attributtes[:csv_file],
                                  domain: attributtes[:domain])

      expect(catalog).not_to be_valid
      expect(catalog.errors[field]).to include(error_message)
    end
  end

  it_behaves_like('it tries to create an invalid model', :status,
                  I18n.t('activerecord.errors.messages.invalid'),
                  status: Faker::Name.name)

  it_behaves_like('it tries to create an invalid model', :csv_file,
                  I18n.t('activerecord.errors.messages.blank'))

  it_behaves_like('it tries to create an invalid model', :csv_file,
                  I18n.t('activerecord.errors.messages.csv_file.unknown_encoding'),
                  csv_file: self.prepare_file("unknown_encoding.csv"))

  it_behaves_like('it tries to create an invalid model', :csv_file,
                  I18n.t('activerecord.errors.messages.csv_file.malformed'),
                  csv_file: self.prepare_file("malformed.csv"))

  it_behaves_like('it tries to create an invalid model', :csv_file,
                  I18n.t('activerecord.errors.messages.csv_file.empty'),
                  csv_file: self.prepare_file("empty.csv"))

  it_behaves_like('it tries to create an invalid model', :domain,
                  I18n.t('activerecord.errors.messages.blank'))
end
