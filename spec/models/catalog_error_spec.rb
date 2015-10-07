require 'rails_helper'

RSpec.describe CatalogError, type: :catalog_model do

  describe 'Catalog associations' do
    it { should belong_to(:catalog) }
  end
end
