class OmniauthCallbacksController < ApplicationController
	skip_before_filter :authenticate_user!, :only => [:facebook]
	def facebook

    network = Network.find_by_subdomain(request.subdomain)

    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user,network,request.domain,request.subdomain)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
