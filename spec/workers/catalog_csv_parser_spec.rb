require 'rails_helper'

RSpec.describe CatalogCSVParserWorker, type: :catalog_model do

  shared_examples 'it tries to parse a csv file' do |message, filename, final_status|
    it "it tries to parse all users #{message}" do
      create(:network)
      catalog = create(:catalog, csv_file: self.prepare_file(filename))

      CatalogCSVParserWorker.new.perform(catalog.id)
      catalog = Catalog.find_by_id(catalog.id)
      expect(catalog.status).to eq(final_status)
    end
  end


  it_behaves_like('it tries to parse a csv file', "without errors", "valid.csv", "accepted")

  it_behaves_like('it tries to parse a csv file', "without errors", "excel_valid_encoding.csv", "accepted")

  it_behaves_like('it tries to parse a csv file', "with errors", "invalid.csv", "rejected")

end
