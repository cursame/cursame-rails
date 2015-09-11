require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'User associations' do
    it { should have_one(:user_language) }
    it { should have_one(:language).through(:user_language) }
    it { should accept_nested_attributes_for :user_language }
    it { should allow_mass_assignment_of :user_language_attributes }
  end
end
