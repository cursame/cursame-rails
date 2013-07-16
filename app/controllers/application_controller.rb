class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!#, :unless => :awaiting_confirmation
  helper_method :current_network
  helper_method :network_member
  helper_method :random_string_for_user_url
  helper_method :links
  helper_method :user_url
  helper_method :current_friend
  helper_method :alfredot_rifa_free_pro_forever
  helper_method :current_role
  helper_method :current_course
  helper_method :activation_activity
  helper_method :computer_plataform
  helper_method :version_browser
  helper_method :browser
  helper_method :filtrati
  helper_method :parse
  helper_method :show_joyride
  helper_method :get_chat_title
  #roles
  before_filter :set_current_user
  #chat
  before_filter :chat_online_users

  helper_method :refresh_token_for_google
  helper_method :random
  helper_method :numeric_random
  helper_method :call_rake

  #helpers para contenido
  helper_method :client_youtube
  helper_method :auth_hash


  # errores
   # Se declaran los errores personalizados


  #data of the networks you are
  def current_network
    @current_network ||= Network.find_by_subdomain(filter_subdomain(request.subdomain.downcase))
  end

  def current_network?
      if current_network != nil
           u_u = "#{current_network.subdomain}.#{links}"
        else
           u_u = "#{current_network.subdomain}.#{links}"
      end
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
       when Rails.env == 'development'
         @link = 'lvh.me:3000'
       when Rails.env == 'production'
         #@link = 'cursatest.com'
          @link = 'cursame.com'
       when Rails.env == 'test'
         #@link = 'cursatest.com'
       when Rails.env == 'subtest'
         @link = 'cursalab.com'

     end
  end
  #determinate the first redirection url before loggin
  def user_url
     current_user.personal_url
  end

  #help to find friend
  #def current_friend
   #   @user_friend = User.find_by_personal_url(params[:personal_url])
  #end

  def current_course
      @course = Course.find(params[:id])
  end

  ####### difininiendo variables de miembros de una red de forma global ########

  ######## definiendo miembro de la red #########

  def network_member
     @permisos = Permissioning.find_by_user_id_and_network_id(current_user.id, current_network.id)
  end

  def filtrati
    if current_role == "superadmin"
    else
     if network_member != nil
     else
       redirect_to "/users/sign_out"
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
    string  =  (0...220).map{ o[rand(o.length)] }.join
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
    #@permisos = Permissioning.find_by_user_id_and_network_id(current_user.id, current_network.id)

    @permisos = current_user.permissionings.last
    @role = Role.find_by_id(@permisos.role_id)
    @role.title
  end
  ###### comandos de generación de actividades
  def activation_activity
      @activity = Activity.new
        @activity.title =  @az.title
        @activity.activitye_id= @az.id
        @activity.activitye_type =  @typed
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

  #### like_compare

  def compare_like
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

  #joyride
  def show_joyride(tour)
    return User.find(current_user.id).tour_info[tour]
  end

  def get_chat_title(channel)

    type = channel.channel_name ? channel.channel_name.split('/') : 'Chat'
    type = type[2].split('_')

    if type[0] == 'course'
      return Course.find_by_id(type[2]).title
    else
      chat_title = ''
      channel.users.reject{ |user| user.id == current_user.id }.first(3).each_with_index do |u, index|
        chat_title += u.name + ' '
      end
      return chat_title
    end
  end

  def mobile?
   # request.user_agent =~ /Mobile|webOS/
    # request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"][/(iPhone|iPod|Android)/]
    puts request.env["HTTP_USER_AGENT"]
    request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"][/(iPhone|iPod|iPad|Android|Mobile)/]

  end
  helper_method :mobile?


  def client_youtube
    client = YouTubeIt::Client.new(:dev_key => "AI39si5yjznaXM1CWGbLUf6fq9x-MKjeOi9b6cF6lWTayZO45jLHs1nVtMEnUCawKguHUyvLl-I13WLHe50tR_80tZ4aLRd4MQ")
  end

  def auth_hash
      omniauth = request.env["omniauth.auth"]
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

  # -----------------------------
  # chat behaviour of cursame
  # -----------------------------

  def chat_online_users
    if current_user
      @friends_online = current_user.friends(true)
      @courses_online = current_user.courses
      @show_chat_panel = true
    end
  end
end
