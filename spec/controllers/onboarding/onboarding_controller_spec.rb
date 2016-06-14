require 'rails_helper'

RSpec.describe OnboardingController, type: :controller do
  render_views

  before :each do
    @network = create(:network)
    @teacher = create(:user, role: 'teacher')
    @student = create(:user, role: 'student')
    sign_in @teacher
  end

  describe 'GET #user_profile' do
    before :each do
      get :user_profile
    end

    it 'has 302 status' do
      expect(response).to have_http_status(200)
    end

    it 'redirect_to the user_profile path' do
      expect(response).to render_template(:user_profile)
    end
  end

  describe 'PUT #update_user_profile' do
    before :each do
      @user = create(:user)
      @new_first_name = Faker::Name.first_name
      @new_last_name = Faker::Name.last_name
      @new_bios = Faker::Lorem.paragraph(2)
      @new_email = Faker::Internet.email

      put :update_user_profile, id: @user.id, user: {
        first_name: @new_first_name,
        last_name: @new_last_name,
        bios: @new_bios,
        email: @new_email
      }

      @updated_user = User.find @user.id
    end

    it 'should update user first_name' do
      expect(@updated_user.first_name).to eq(@new_first_name)
    end

    it 'should update user last_name' do
      expect(@updated_user.last_name).to eq(@new_last_name)
    end

    it 'should update user bios' do
      expect(@updated_user.bios).to eq(@new_bios)
    end

    it 'has 302 status' do
      expect(response.status).to eq(302)
    end
  end
end
