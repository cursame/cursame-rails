require 'rails_helper'

RSpec.feature 'Select network friends' do
  background do
    @network = create(:network)
    @student = create(:user, role: 'student')
    @friend = create(:user, role: 'student')
  end

  describe 'Select a user to be friends' do
    scenario 'click Button to send request' do
      given_logged_in_as(@student)
      visit onboarding_friendship_path
      expect(page).to have_content(I18n.t('onboarding.show_network_users.user_profile_step'))
      expect{
        click_on (I18n.t('users.shared.user_card.add_friends'))
      }.to change { Friendship.count }
    end
  end
end
