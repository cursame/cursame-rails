require 'rails_helper'

RSpec.describe SuperadminPanel::UsersController, type: :controller do

  before :each do
    create(:network)
    user = create(:user, role: "superadmin")
    sign_in user
  end

  describe "Get #index"
  it "get #index" do
    get :index
    expect(response).to have_http_status(200)
  end
end
