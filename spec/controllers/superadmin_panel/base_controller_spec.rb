require 'rails_helper'

RSpec.describe SuperadminPanel::BaseController, type: :controller do

  describe "Get #index" do

    shared_examples "with permissions" do |roles|

      roles.each do |role|

        before :each do
          if !Network.find_by_subdomain('testing')
            create(:network)
          end
          user = create(:user, role: role)

          sign_in user
          get :index
        end

        it "user #{role} has 200 status" do
          expect(response).to have_http_status(200)
        end
      end
    end

    it_behaves_like "with permissions", ["superadmin"]

    shared_examples "without permissions" do |roles|

      roles.each do |role|

        before :each do
          if role
            if !Network.find_by_subdomain('testing')
              create(:network)
            end
            user = create(:user, role: role)
            sign_in user
          end
          get :index
        end

        it "user #{role ? role : "guest"} has 302 status" do
          expect(response).to have_http_status(302)
        end
      end
    end

    it_behaves_like "without permissions", ["admin", "mentor_link", "operator", "teacher", "student", nil]
  end
end
