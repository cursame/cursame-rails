class UsessionsController < Devise::SessionsController
    layout "sessions"
    require "devise"
    prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
    prepend_before_filter :allow_params_authentication!, :only => :create
    prepend_before_filter { request.env["devise.skip_timeout"] = true }

    before_filter :set_offline, :only => :destroy

    # GET /resource/sign_in
    def new
      self.resource = resource_class.new()      
      clean_up_passwords(resource)
      respond_with(resource, serialize_options(resource))      
    end

    # POST /resource/sign_in
    def create      
      self.resource = warden.authenticate!(auth_options)
      set_flash_message(:notice, :signed_in) if is_navigational_format?
     
      @find_user = User.find_by_email(resource.email)

      @find_user.online = true
      @find_user.save!

      # avisamos que el usuario se conecto
       PrivatePub.publish_to("/messages/chat_notifications",
                              userId: @find_user.id,
                              online: true
                             )
      

      find_permissionings = Permissioning.where(:user_id => @find_user.id, :network_id => current_network.id)
      
      if find_permissionings == nil
            permissions = Permissioning.where(:user_id => @find_user.id)
            ############## encontrando permissionings
               if permissions != nil
                    ############ validando contador de permissionings
                    if permissions.count == 1
                       @permission = permissions.first
                          ####### encontrando redes
                          find_network = Network.find(@permission.network_id)
                             ###### validando que la red no sea nula para redirigir
                          if find_network != nil
                             ####### redirecciona la red
                             puts "****************** se ha encontrado una red a la cual seras redirigido ************"
                             
                             redirect_to "http://#{find_network.subdomain}.#{links}"
                          end
                      else
                       ####### se deja abierto para los permisos que estan pendientes
                       puts "*************** demasiados *****************"  
                    end
               end
        else          
         sign_in(resource_name, resource)
         respond_with resource, :location => after_sign_in_path_for(resource)   
      end
   
    end
  

    # DELETE /resource/sign_out
    def destroy
      
      puts "***************************************** Destruyendo Session *********************************************"
      redirect_path = after_sign_out_path_for(resource_name)
      sign_out(current_user) 

      respond_to do |format|
        format.all { head :no_content }
        format.any(*navigational_formats) { redirect_to redirect_path }
      end
    end

    protected
    
    def devise_parameter_sanitizer
      @devise_parameter_sanitizer ||= if defined?(ActionController::StrongParameters)
        Devise::ParameterSanitizer.new(resource_class, resource_name, params)
      else
        Devise::BaseSanitizer.new(resource_class, resource_name, params)
      end
    end
    
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }
    end
    
    def sign_in_params
      devise_parameter_sanitizer.sanitize(:sign_in)
    end

    def serialize_options(resource)
      methods = resource_class.authentication_keys.dup
      methods = methods.keys if methods.is_a?(Hash)
      methods << :password if resource.respond_to?(:password)
      { :methods => methods, :only => [:password] }
    end

    def auth_options
      { :scope => resource_name, :recall => "#{controller_path}#new" }
    end

    private

    def set_offline
      if current_user
        current_user.online = false
        current_user.save!
        #avisamos que ya de desconecto el usuario
        PrivatePub.publish_to("/messages/chat_notifications",
                              userId: current_user.id,
                              online: false
                            )
      end     
    end
end
