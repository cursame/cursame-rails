class Api::Sessions::SessionsController < ApplicationController
  skip_before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token
  after_filter :set_access_control_headers
  respond_to :json

  def create
    email = params[:email]
    password = params[:password]

    if email.blank?
      render status: 400, json: { status: "ERROR", description: "Need email to process de request", response: {} }
      return
    elsif password.blank?
      render status: 400, json: { status: "ERROR", description: "Need password to process de request", response: {} }
      return
    end

    @user = User.find_by_email(email.downcase)

    if @user.nil?
      render status: 400, json: { status: "ERROR", description: "Email incorrect", response: {} }
      return
    elsif @user.valid_password?(password)
      @user.ensure_authentication_token!
      @subdomain = @user.subdomain

      render status: 200, json: { status: "OK", description: "The request has succeeded", response: { token: @user.authentication_token, subdomain: @subdomain }}
      return
    else
      render status: 400, json: { status: "ERROR", description: "Password incorrect", response: {} }
      return        
    end
  end

  private
  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = "*"
    headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
  end
end
