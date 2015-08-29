require 'rails_helper'

RSpec.describe Network::NetworksController, type: :controller do

  before :each do
    @net = create(:network)
    user = create(:user, role: 'admin')
    sign_in user
    request.env["HTTP_REFERER"] = 'http://testing.lvh.me:3001/managers/settings'
  end

  describe 'POST update' do
    context 'with valid attributes' do
      it 'modify the current network' do
        put :update, id: @net, network: FactoryGirl.attributes_for(:network)
        expect(response).to have_http_status(302)
      end
    end
  end
end
