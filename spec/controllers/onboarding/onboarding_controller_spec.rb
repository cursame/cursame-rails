require 'rails_helper'

RSpec.describe OnboardingController, type: :controller do
  render_views

  before :each do
    @network = create(:network)
    @student = create(:user, role: 'student')
    sign_in @student
  end

  describe 'GET onboardingProfile' do
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

  describe 'PATCH update' do
    before :each do
      @user = create(:user)
      @new_first_name = Faker::Name.first_name
      @new_last_name = Faker::Name.last_name
      @new_bios = Faker::Lorem.paragraph(2)
      @new_email = Faker::Internet.email

      patch :update_user_profile, id: @user.id, user: {
        first_name: @new_first_name,
        last_name: @new_last_name,
        bios: @new_bio,
        email: @new_email
      }

      it 'should update user first_name' do
        expect(@user.first_name).to eq(@new_first_name)
      end

      it 'should update user last_name' do
        expect(@user.last_name).to eq(@new_last_name)
      end

      it 'should update user bios' do
        expect(@user.bios).to eq(@new_bios)
      end

      it 'should update user email' do
        expect(@user.email).to eq(@new_email)
      end

      it 'has 200 status' do
        expect(response.status).to eq(200)
      end
    end
  end
end
