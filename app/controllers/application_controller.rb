class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  helper_method :current_network
  helper_method :network_member
  helper_method :random_string_for_user_url
  helper_method :links
  helper_method :user_url
  helper_method :current_friend  
  helper_method :current_course
  helper_method :alfredot_rifa_free_pro_forever
  helper_method :current_role
  helper_method :activation_activity
  helper_method :computer_plataform
  helper_method :version_browser
  helper_method :browser
  
  #roles
  before_filter :set_current_user

  helper_method :refresh_token_for_google
  helper_method :random

  #data of the networks you are
  def current_network
    @current_network ||= Network.find_by_subdomain(filter_subdomain(request.subdomain.downcase))
  end
  
  #this method filtered the subdomail
  def filter_subdomain(subdomain)
     if subdomain.match(/\Awww\..+/)
       return subdomain[4..-1]
     else
       return subdomain
     end
  end
  
  
  #this code generate the random_personal_url in the register user
  def random_string_for_user_url
   user_random = "#{user_url_random} #{numeric_random}"
  end
  #links to redirect the user to the networks
  def links
     case
       when Rails.env = 'development'
         @link = 'lvh.me:3000'
       when Rails.env = 'production'
         @link = 'cursa.me'
       when Rails.env = 'test'
         @link = 'cursatest.com'
     end
  end
  #determinate the first redirection url before loggin
  def user_url
     current_user.personal_url
  end
 
  #help to find friend
  def current_friend
      @user = User.find_by_personal_url(params[:personal_url])
  end
  
  def current_course
      @course = Course.find(params[:id])
  end
  
  ####### difininiendo variables de miembros de una red de forma global ########
  
  ######## definiendo miembro de la red #########
  
  def network_member
          
             current_network.networks_users.each do |cu|
               @user_id = cu.user_id
                   @user_member = User.find_by_id(@user_id)
               return false
             end
             
             if @user_member == current_user.id
                @notice = "Bienvenido a #{current_network.name} "
              else
               render new_networks_user_path
            end
    
  end
  
  ######## definiendo role del usuario ########
 
  def user_permissions_in_network
     
            current_network.networks_users.each do |cut|
               @user_id = cut.user_id
               @role_id = cut.role_id
                  @user_member = User.find_by_id(@user_id)
                  @role_member = User.find_by_id(@role_id)
                  return false
            end
    
             
                if @user_member == current_user
                   
                     @role_member.role_id_and_permission_ids.each do |rm|
                     end
                     
                else @user_member != current_user
                  
                     @role_member.role_id_and_permission_ids.each do |rm|
                     end
                end
      
    
  end
  
  def random
    general_random = "#{string_random}_#{numeric_random}"
  end
  
  def string_random
     o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
      string  =  (0...30).map{ o[rand(o.length)] }.join
  end
  def numeric_random
     numeric = rand(0..777567890654321)
  end
  
  def user_url_random
    o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    string  =  (0...260).map{ o[rand(o.length)] }.join
  end
  
  def alfredot_rifa_free_pro_forever
     puts "alfredot rifa free pro forever 2013"
     puts "
     _+88__________________________...
     _+880_________________________...
     _++88_________________________...
     _++88_________________________...
     __+880________________________...
     __+888________________________...
     __++880______________________+...
     __++888_____+++88__________+++...
     __++8888__+++8880++88____+++88...
     __+++8888+++8880++8888__++888_...
     ___++888++8888+++888888++888__...
     ___++88++8888++8888888++888___...
     ___++++++888888888888888888___...
     ____++++++88888888888888888___...
     ____++++++++000888888888888___...
     _____+++++++000088888888888___...
     ______+++++++00088888888888___...
     _______+++++++088888888888____...
     _______+++++++088888888888____...
     ________+++++++8888888888_____...
     ________++++++0088888888______...
     ________+++++0008888888_______...
     ________...............8888888... "
   end

   def fail_in_save
     puts "fallo al guardar en el sistema"
   end
  
  def current_role
    #@permissioning = current_user.permissionings.where(:network_id => current_network.id, :user_id => current_user.id)
    @permisos = Permissioning.find_by_user_id_and_network_id(current_user.id, current_network.id)
    @role = Role.find_by_id(@permisos.role_id)
    @role.title
  end
  ###### comandos de generación de actividades
  def activation_activity
      @activity = Activity.new
        @activity.title =  @delivery.title
        @activity.activitye_id= @delivery.id
        @activity.activitye_type =   @typed
        @activity.ip_address = request.ip
        
        city = request.location.city
        country = request.location.country_code
        ip = request.ip
        puts '***************************'
        
        puts city
        puts country
        puts ip
        
        puts '***************************'
        @activity.address = "#{city} #{country}"
        @activity.browser = "#{browser_active}"
        @activity.version_browser ="#{browser_version}"
        @activity.computer_plataform = "#{computer_platform}"
        @activity.user_id = current_user.id
        #@activity.network_id = 1 #current_network.id
        @activity.save
  end
  
  def browser_active
    @data_integrate = request.env['HTTP_USER_AGENT']
    @user_agent = UserAgent.parse(@data_integrate)
    @browser = @user_agent.browser    
  end

  def browser_version
    @data_integrate = request.env['HTTP_USER_AGENT']
    @user_agent = UserAgent.parse(@data_integrate)
    @browser = @user_agent.version
  end
  
  def computer_platform
    @data_integrate = request.env['HTTP_USER_AGENT']
    @user_agent = UserAgent.parse(@data_integrate)
    @computer_plataform = @user_agent.platform
  end
  
  protected
  #roles
  def permission_denied
    flash[:error] = "Sorry, you are not allowed to access that page."
    redirect_to root_url
  end

  def set_current_user
    Authorization.current_user = current_user
  end
end
