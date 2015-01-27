class Api::Sessions::SessionsController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def create
    if request.headers["CONTENT_TYPE"] != 'application/json'
      render status => 400, :json => {:status => "ERROR", :description => "The request must be JSON" ,:response => {}}, :callback => params[:callback]
      return
    end

    email = params[:email]
    password = params[:password]

    if email.blank?
      render :status => 400, :json => {:status => "ERROR", :description => "Need email to process de request" ,:response => {}}, :callback => params[:callback]
      return

    elsif password.blank?
      render :status => 400, :json => {:status => "ERROR", :description => "Need password to process de request" ,:response => {}}, :callback => params[:callback]
      return
    end

    @user = User.find_by_email(email.downcase)

    if @user.nil?
      render :status => 400, :json => {:status => "ERROR", :description => "Email incorrect" ,:response => {}}, :callback => params[:callback]
      return

    elsif @user.valid_password?(password)
      @user.ensure_authentication_token!
      @subdomain = @user.subdomain

      render :status => 200, :json => {:status => "OK", :description => "The request has succeeded" ,:response => {:token => @user.authentication_token, :subdomain => @subdomain}}, :callback => params[:callback]
      return
    else
      render :status => 400, :json => {:status => "ERROR", :description => "Password incorrect" ,:response => {}}, :callback => params[:callback]
      return        
    end

  end

end