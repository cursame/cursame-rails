require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    create(:network)
    @user = create(:user)
    sign_in @user
  end

  describe 'PUT #update' do
    let(:attr) do
      { first_name: 'new first', last_name: 'new last', email: @user.email,
      bios: '.', twitter_link: '', personal_url: @user.personal_url,
      password: @user.password, password_confirmation: @user.password_confirmation,
      current_password: @user.password }
    end
    context 'with valid attributes' do
      it 'saves the update user info in the database' do
        put :update, id: @user.id, user: attr
        @user.reload
        expect(response).to have_http_status(302)
      end
      it 'redirects to the user profile page' do
        expect(response).to render_template(@user)
      end
    end

    context 'with invalid attributes' do
      let(:attr) do
        { first_name: 'new first', last_name: 'new last', email: @user.email,
        bios: '.', twitter_link: '', personal_url: @user.personal_url,
        password: @user.password, password_confirmation: 'invalid',
        current_password: @user.password }
      end
      it 'render the edit user view' do
        put :update, id: @user.id, user: attr
        expect(response).to render_template :edit
      end
    end
  end
end
