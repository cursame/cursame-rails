class Api::Sessions::SessionsController < ApplicationController
	skip_before_filter :authenticate_user!
	skip_before_filter :verify_authenticity_token
	respond_to :json

	def create
	  email = params[:email]
	  password = params[:password]

	  if email.blank? or password.blank?
	  	render :status => 200, :json => {:message => "Email and password must be strings"}, :callback => params[:callback]
	  	return
	  end

      @user = User.find_by_email(email.downcase)

	  if @user.nil?
	  	render :status => 200, :json => {:message => "Invalid email or password."}, :callback => params[:callback]
	  	return
	  end

	  @user.ensure_authentication_token!
	  @subdomain = @user.subdomain

	  if @user.valid_password?(password)
	  	render :status => 200, :json => {:token => @user.authentication_token, :subdomain => @subdomain}, :callback => params[:callback]
	  	return
	  else
	  	render :status => 200, :json => {:message => "Invalid email or password."}, :callback => params[:callback]
	  	return
	  end
	end

end