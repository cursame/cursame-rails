require 'rails_helper'

RSpec.describe Language, type: :model do
  describe 'model factory' do
    it "has a valid factory" do
      expect(create(:language)).to be_valid
    end
    it "is invalid without a Name" do
      expect(build(:language, name: nil)).not_to be_valid
    end
    it "is invalid without a Code" do
      expect(build(:language, code: nil)).not_to be_valid
    end
  end
end
