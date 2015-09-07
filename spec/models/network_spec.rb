require 'rails_helper'

RSpec.describe Network, type: :model do
  describe 'model factory' do
    it "has a multilanguage default attribute set to false" do
      net = create(:network)
      expect(net.multilanguage).to eq(false)
    end
  end
end
