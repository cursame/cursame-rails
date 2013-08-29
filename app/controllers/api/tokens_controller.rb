class Api::TokensController < ApplicationController
	skip_before_filter :authenticate_user!
	skip_before_filter :verify_authenticity_token
	respond_to :json

	def create
		email = params[:email]
		password = params[:password]
		recover = params[:recover]

		if request.format != :json
			render :status=>200, :json => {:response => {:message => "The request must be json.",:success => false}}, :callback => params[:callback]
			return
		end

		if email and recover
			@user = User.find_by_email(email.downcase)
			if @user.nil?
				logger.info("User #{email} failed signin, user cannot be found.")
				render :status => 200, :json => {:response => {:message => "Invalid email.",:success => false}}, :callback => params[:callback]
				return
			end
			network = @user.networks.first if @user.networks.first
			password_length = 6
			password = Devise.friendly_token.first(password_length)
      #password = User.generate_token('password')
      # User.create!(:email => 'someone@something.com', :password => password, :password_confirmation => password)
      @user.password = password
      puts '-------------------'
      # puts password
      if(@user.save)
      	UserMailer.user_password(@user, network, password).deliver
      	render :status => 200, :json => {:response => {:message => "Se ha enviado tu contrasena a tu Email",:success => true}}, :callback => params[:callback]
      else
      	render :status => 200, :json => {:response => {:message => "El usuario no existe, verifica tu Email ",:success => true}}, :callback => params[:callback]
      end
      return
  end

  if email.nil? or password.nil?
  	render :status => 200, :json => {:response => {:message => "The request must contain the user email and password.",:success => false}}, :callback => params[:callback]
  	return
  end

  @user = User.find_by_email(email.downcase)

  if @user.nil?
  	logger.info("User #{email} failed signin, user cannot be found.")
  	render :status => 200, :json => {:response => {:message => "Invalid email or password.",:success => false}}, :callback => params[:callback]
  	return
  end    

  if current_network && @user && @user.networks.where(:id => current_network.id).count == 0
  	logger.info("User #{email} failed signin, wrong network.")
  	render :status => 200, :json => {:response => {:message => "Invalid network, choose the network you belong to.",:success => false}}, :callback => params[:callback]
  	return
  end

    # http://rdoc.info/github/plataformatec/devise/master/Devise/Models/TokenAuthenticatable
    @user.ensure_authentication_token!
    
    if not @user.valid_password?(password)
    	logger.info("User #{email} failed signin, password \"#{password}\" is invalid.")
    	render :status => 200, :json => {:response =>{:message => "Invalid email or password.", :success => false}}, :callback => params[:callback]
    else
      @notifications_chanel =  PrivatePub.subscription(:channel => "/notifications/"+@user.id.to_s)
    	render :status => 200, :json => {:response =>{:user => @user.as_json(:include => [:roles, :notifications]), :token => @user.authentication_token,:channel => @notifications_chanel,:success => true}}, :callback => params[:callback]
    end
end

def native_create_user
    email = params[:email]
    first_name = params[:first_name]
    last_name = params[:last_name]
    password = params[:password]
    subdomain = params[:subdomain] || 'recreo'

    if email && first_name && last_name && password && subdomain
      permissioning = Permissioning.new()
      permissioning.role_id = params[:role]
      permissioning.network_id = Network.find_by_subdomain(subdomain) || Network.last

      user = User.new()
      user.email = email
      user.password = password
      user.first_name = first_name
      user.last_name = last_name
      user.personal_url = email
      user.subdomain = subdomain
      user.domain = "cursa.me" 
      user.permissionings.push(permissioning)

      success = user.save!
      msg = success ? "Usuario registrado!" : "Error al guardar usuario"
    else
      success= false
      msg = "Faltan campos obligatorios"
    end

    render :json => {:success => success, :msg => msg}, :callback => params[:callback]
end

def destroy
	@user=User.find_by_authentication_token(params[:id])
	if @user.nil?
		logger.info("Token not found.")
		render :status => 404, :json => {:response =>{:message => "Invalid token", :success => false}}
	else
		@user.reset_authentication_token!
		render :status => 200, :json => {:response =>{:token => params[:id], :success => true}}
	end
end

end
