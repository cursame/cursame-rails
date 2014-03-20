# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base

  #protect_from_forgery
  #skip_before_filter  :verify_authenticity_token
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

  #metodo de lista de iconos

  helper_method :icon

  #metodo de acceso a los avatares
  helper_method :avatar
  helper_method :agil_find_user
  # helper methos de fechas 

  helper_method :es_month
  helper_method :es_day
  helper_method :es_current_date
  #helpers para contenido
  helper_method :client_youtube
  helper_method :auth_hash
  helper_method :courses_with_permissions

  #current_user_course_when_inscript
  helper_method :current_user_courses
  #quit cache
  helper_method :cache_expire
  
  def cache_expire 
    cache = ActiveSupport::Cache::MemoryStore.new(expires_in: 10.minutes)
  end

  #data of the networks you are
  def current_network
    @current_network ||= Network.find_by_subdomain(filter_subdomain(request.subdomain.downcase))
    if !current_user.nil? then
      if (current_user.subdomain != @current_network.subdomain) then
        networks = current_user.networks
        if (networks.include?(@current_network)) then
          current_user.update_attributes(:subdomain => @current_network.subdomain)
        end
      end
    end
    @current_network
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
         @link = 'cursa.me'
       when Rails.env == 'test'
         @link = 'lvh.me:3001'
       when Rails.env == 'subtest'
         @link = 'cursa.me'
        else
          @link = 'cursa.me'
         
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
  
  def current_user_courses
     @ccc = current_user.courses.where(:network_id => current_network.id, :active_status => true)
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
        if  network_member.suspended == true
            sign_out(current_user)
            redirect_to :back
        else
        end
     else
         render '/networks/alertmethod'
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
     puts "alfredot rifa free pro forever 2014"
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
     puts "casual aqui programando "
     puts "Desarrolladores 2014:"
     puts '**************************************'
     puts "Alfredo Reyes de Antuñano"
     puts "Emiliano Cabrera Blancas"
     puts "Salvador López Mendoza"
     puts "Armando Gonzalez López"
     puts '**************************************'
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
     #case @role.title
      # when 'admin'
       # @role_t = "Administrador"
       #when 'student'
       # @role_t = "Estudiante"
       #when 'teacher'
        #@role_t = "Profesor"
       #else
        #@role.title
     #end
  end
  ###### comandos de generación de actividades
  def activation_activity
    @activity = Activity.new
    @activity.title =  @az.title
    @activity.activitye_id= @az.id
    @activity.activitye_type =  @typed
    @activity.ip_address = request.ip

    if(request && request.location)
      city = request.location.city
      if city == nil
        ct = 'Location City not Found'
      else
        ct = city
      end

      country = request.location.country_code

      if country == nil
        cot = 'Location Country not Found'
      else
        cot = country
      end

      ip = request.ip

      @activity.address = "#{ct} #{cot}"
      @activity.browser = "#{browser_active}"
      @activity.version_browser ="#{browser_version}"
      @activity.computer_plataform = "#{computer_platform}"
      @activity.user_id = current_user.id
      @activity.save
    end    
  end

  #### like_compare

  def compare_like
  end

  #### validate brwosers

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

  def browser

    string = request.env['HTTP_USER_AGENT']
    user_agent = UserAgent.parse(string)

    @browser =   user_agent.browser
    @version =   user_agent.version
    @version_sintetica = @version.to_s.delete(".")
    @total = "#{@browser} #{ @version}"
    puts @total
    case

     when @browser == 'Chrome'
        if @version > '230127191'
          puts "navegador no compatible"
          @compatible = false
        else
          puts "navegador compatible"
          @compatible = true
        end
     when @browser == 'Safari'

        if @version && @version > '500'
          puts "navegador no compatible"
          @compatible = false
        else
          puts "navegador compatible"
          @compatible = true
        end

     when @browser == 'Firefox'

       if @version > '190'
         puts "navegador no compatible"
         @compatible = false
       else
         puts "navegador compatible"
         @compatible = true
       end

     when @browser == 'Internet Explorer'

       if @version > '80'
         puts "navegador no compatible"
         @compatible = false
       else
         puts "navegador compatible"
         @compatible = true
       end
     else

         puts "navegador no compatible"
         @compatible = false


   end

  @status = @compatible

  end

  ######


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

  def courses_with_permissions
    courses = []

    case current_user.roles.last.id
      # when 1 #si es admin
      #   return current_user.courses
      when 2 #si es alumno
        current_user.courses.each do |course|
          if !course.members_in_courses.where(:user_id =>current_user.id,:accepted => true).empty?
            courses.push(course)
          end
        end
        return courses
      when 3 #si es maestro
        current_user.courses.each do |course|
          if !course.members_in_courses.where(:user_id =>current_user.id,:accepted => true, :owner =>true).empty?
            courses.push(course)
          end
        end
        return courses
      else
      # when 4 #super admin
      #   return current_user.courses
      # when 5 #supervisor
        return current_user.courses
    end
  end

  ###### valida los iconos dentro de la aplicación ######

  def icon(name)
    @match_list = "<i class='i i-#{name}'></i>"
    @match_list.html_safe
  end

  ###### validadores de avatars dentro de la aplicación ######
  
  def avatar(type, size, url, destinate, clase, identificador, resize_to)
    
    
    ##### casos para la url
    case
      when url == 'no'
        object_url = ''
        object_url_end = ''
      when url != 'no'
        object_url = '<a'+ ' href='+ "#{url}" +'>'
        object_url_end = '</a>'
    end
        
    #### casos para resize_to

    case
      when resize_to == 'no'
        object_resize_to = ''
      when resize_to != 'no'
        object_resize_to = " width="+"'"+"#{resize_to}px"+"'" + " height=" +"'"+ "#{resize_to}px"+"'"
    end
    
     
    ### coloca una clase en la imagen
    case
      when clase == 'no'
        object_clase = ''
      when clase != 'no'
        object_clase =  (" class='#{clase}'").to_s
    end
    ### coloca un id en la imagen
    case
      when identificador == 'no'
        object_identificador = ''
      when identificador != 'no'
        object_identificador = " id="+"#{identificador}"
    end

    ### se macha en el tipo de imagen
    case
     when type == "course"
            #### se crea el obejto que se busca
            object = Course.find_by_id(destinate)
            ##puts object
            #### se revisa si el objeto contiene avatar
            if object.avatar.file != nil && File.exist?(object.avatar.file.file)
               #### si el objeto contiene un avatar se machan las diversas medidas 
               case 
                when size == '10'
                  @self_avatar = object_url+'<img  src='+"#{object.avatar.compress}"+ object_resize_to+ "object_clase" + object_identificador +'>'+ object_url_end
                when size == '25'
                  @self_avatar = object_url+'<img  src='+"#{object.avatar.mini}"+ object_resize_to+ object_clase+ object_identificador +'>'+ object_url_end
                when size == '30'
                  @self_avatar = object_url+'<img src='+"#{object.avatar.head}"+ object_resize_to+ object_clase + object_identificador +'>'+ object_url_end
                when size == '45'
                  @self_avatar = object_url+'<img src='+"#{object.avatar.modern}"+ object_resize_to+ object_clase + object_identificador +'>'+ object_url_end
                when size == '150'
                  @self_avatar = object_url+'<img src='+"#{object.avatar.profile}"+ object_resize_to+ object_clase + object_identificador +'>'+ object_url_end
                               
               end
            else
               case 
                when size == '10'
                  @self_avatar = object_url+'<img src='+"'/assets/course-avatarxxxx.png'"+ object_resize_to+ object_clase + object_identificador +'>'+ object_url_end
                when size == '25'
                  @self_avatar = object_url+'<img src='+"'/assets/course-avatarxxx.png'"+ object_resize_to+ object_clase + object_identificador +'>'+ object_url_end
                when size == '30'
                  @self_avatar = object_url+'<img src='+"'/assets/course-avatarxxx.png'"+ object_resize_to+ object_clase + object_identificador +'>'+ object_url_end
                when size == '45'
                  @self_avatar = object_url+'<img src='+"'/assets/course-avatarxx.png'"+ object_resize_to+ object_clase + object_identificador +'>'+ object_url_end
                when size == '150'
                  @self_avatar = object_url+'<img src='+"'/assets/course-avatarx.png'"+ object_resize_to+ object_clase + object_identificador +'>'+ object_url_end
                end

            end
            

     when type == "user"
            #### se crea el obejto que se busca
            object = User.find_by_id(destinate)
            ###puts object
            #### se revisa si el objeto contiene avatar
            if object.avatar.file != nil && File.exist?(object.avatar.file.file)
               #### si el objeto contiene un avatar se machan las diversas medidas 
               case 
                when size == '10'
                  @self_avatar = object_url+'<img src='+"#{object.avatar.compress}"+ object_resize_to+ object_clase +'/>'+ object_url_end
                when size == '25'
                  @self_avatar = object_url+'<img  src='+"#{object.avatar.mini}"+ object_resize_to+ object_clase +'/>'+ object_url_end
                when size == '30'
                  @self_avatar = object_url+'<img src='+"#{object.avatar.head}"+ object_resize_to+ object_clase +'/>'+ object_url_end
                when size == '45'
                  @self_avatar = object_url+'<img src='+"#{object.avatar.modern}"+ object_resize_to+ object_clase +'/>'+ object_url_end
                when size == '150'
                  @self_avatar = object_url+'<img src='+"#{object.avatar.profile}"+ object_resize_to+ object_clase +'/>'+ object_url_end
                               
               end
            else
               case 
                when size == '10'
                  @self_avatar = object_url+'<img src='+"'/assets/course-avatarxxxx.png'"+' '+object_resize_to+ object_clase +'/>'+ object_url_end
                when size == '25'
                  @self_avatar = object_url+'<img src='+"'/assets/imagexx.png'"+' '+ object_resize_to+ object_clase +' />'+ object_url_end
                when size == '30'
                  @self_avatar = object_url+'<img src='+"'/assets/imagexxxx.png'"+' '+object_resize_to+ object_clase +' />'+ object_url_end
                when size == '45'
                  @self_avatar = object_url+'<img src='+"'/assets/imagexxx.png'"+' '+object_resize_to+ object_clase +' />'+ object_url_end
                when size == '150'
                  @self_avatar = object_url+'<img src='+"'/assets/imagex.png'"+' '+object_resize_to+ object_clase +' />'+ object_url_end
                end

            end
            
    end
    
    ##### esta parte del metodo lee en html el helper #####  
    @self_avatar.html_safe  

  end

  ###### ayuda alos cambiar los meses del año a español
  def es_month(monthx = '')
    case
     when monthx == 'January'
      @name = 'Enero'
     when monthx == 'February'
      @name = 'Febrero'
     when monthx == 'March'
      @name = 'Marzo'
     when monthx == 'April'
      @name = 'Abril'
     when monthx == 'May'
      @name = 'Mayo'
     when monthx == 'June'
      @name = 'Junio'
     when monthx == 'July'
      @name = 'Julio'
     when monthx == 'August'
      @name = 'Agosto'
     when monthx == 'September'
      @name = 'Septiembre'
     when monthx == 'October'
      @name = 'Octubre'
     when monthx == 'November'
      @name = 'Noviembre'
     when monthx == 'December'
      @name = 'Diciembre'
     else
      @name = 'Este no es un més'

    end
  end

  ##### da formato a las fechas en español
  
  def es_current_date(month = '', day = '' , year = '', hour ='',format = 'mexican')
    ##### example :    <%= h  es_current_date("#{@date.strftime( '%B')}","", "#{@date.strftime( '%Y')}")  %>
   
    if hour == nil
       hour_mesage = ""
      else
       hour_mesage = "-#{hour}"
    end

    case 
      when format == 'american'
      case 
        when month != '' && day != '' && year != ''
        @date = "#{es_month(month)} / #{day} / #{year} #{hour_mesage}"
        when month != '' && day != ''
        @date = "#{es_month(month)} / #{day} #{hour_mesage}"
        when month != '' && year != ''
        @date = "#{es_month(month)} / #{year} #{hour_mesage}"
      end
    when format == 'mexican'
       case 
        when month != '' && day != '' && year != ''
        @date = "#{day} / #{es_month(month)} / #{year} #{hour_mesage}"
        when month != '' && day != ''
        @date = "#{day} / #{es_month(month)} #{hour_mesage}"
        when month != '' && year != ''
        @date = "#{es_month(month)} / #{year} #{hour_mesage}"
      end
    when format == 'latin_string'
      case 
        when month != '' && day != '' && year != ''
        @date = "#{day} de #{es_month(month)} del #{year} #{hour_mesage}"
        when month != '' && day != ''
        @date = "#{day} de #{es_month(month)} #{hour_mesage}"
        when month != '' && year != ''
        @date = "#{es_month(month)} del #{year} #{hour_mesage}"
      end
    end 
  end
  
  ###### da formato a los días de la semana en español
  def es_day(esday)
    case 
      when esday != 'Week'
      case 
      when esday == 'Monday'
        @day_name = 'Lunes'
      when esday == 'Tuesday'
        @day_name = 'Martes'  
      when esday == 'Wednesday'
        @day_name = 'Miercoles'  
      when esday == 'Thursday'
        @day_name = 'Juevez'  
      when esday == 'Friday'
        @day_name = 'Viernes'  
      when esday == 'Saturday'
        @day_name = 'Sabado'
      when esday == 'Sunday'
        @day_name = 'Domingo' 
      end
        when esday == 'Week'
        @week = ('Lunes, Martes, Miercoles, Jueves, Viernes, Sabado, Domingo').to_s
    end
  end
  
  ###### metodo para encontrar un usuario de manera facil ######
  def agil_find_user(findX, byX='id')
    case 
      when byX == 'id'  
       @user = User.find_by_id("#{findX}")
      when byx == 'personal_url'
       @user = User.find_by_perosnal_url("#{findX}")
    end
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
