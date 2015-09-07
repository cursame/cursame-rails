require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'User' do
    it { should have_one(:user_language) }
    it { should have_one(:language).through(:user_language) }
  end
end
