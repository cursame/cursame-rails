require 'rails_helper'

RSpec.describe UserLanguage, :type => :model do
  describe 'UserLanguage' do
    it { should belong_to(:language) }
    it { should belong_to(:user) }
    it { should validate_uniqueness_of(:user_id) }
    it { should have_db_index(:user_id) }
    it { should have_db_index(:language_id) }
  end
end
