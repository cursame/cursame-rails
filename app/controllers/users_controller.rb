# -*- coding: utf-8 -*-

require 'charlock_holmes'
require 'charlock_holmes/string'

class UsersController < ApplicationController
  layout 'dashboardlayout', :only => [:dashboard]
  skip_before_filter :authenticate_user!, :only => [:upload_users_a]
  helper_method :filter_friendship

  def show
    @user_l= User.find_by_personal_url(params[:personal_url])
    network_current_user = current_user.permissionings.first.network_id

    if @user_l.nil? or ( @user_l.permissionings.first.network_id != network_current_user )
      redirect_to root_path, flash: { error: t('.users_controller.no_exist')} and return
    end

    #helper methods in aplication controller
    pertenence!
    links
    @course = Course.new
    @delivery = Delivery.new
    @survey = Survey.new

    @courses =  @user_l.members_in_courses.limit(7)
    @ccc =  @user_l.courses.where(:network_id => current_network.id)
    @count_course_iam_member =  MembersInCourse.where(:user_id => current_user.id, :accepted => true, :active_status => true).count

    @count_course_iam_member_and_owner =  @user_l.members_in_courses.where(:owner => true, :network_id => current_network.id, :active_status => true).count

    @course_count = Course.count
    @member =   @user_l.members_in_courses.where(:owner => true)

    ### publicando comentarios en el show de users
    @network_comments = current_network.comments
    @comments = @network_comments.where(:user_id => @accesible_id)

    ### wall
    @id = params[:id]
    id_search = params[:id_search]
    @search = params[:search]
    @page = params[:page].to_i
    if id_search.nil?
      @wall = @user_l.publications.search(@search, @id).paginate(:per_page => 10, :page => params[:page]).order('walls.created_at DESC')
    else
      @wall = @user_l.publications.search(@search, id_search).paginate(:per_page => 10, :page => params[:page]).order('walls.created_at DESC')
    end

    @asset = Asset.new
    assets = @delivery.assets.build

    #### manager courses
    if request.xhr?
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.html {render stream: true}
        format.json { render json: @user_l }
      end
    end
  end

  def pertenence!
    if current_network && @user = User.find_by_personal_url(params[:personal_url])
      @user_pertenence = NetworksUser.find_by_user_id(@user.id)
      if @user_pertenence != nil
        @networks_petenence_user = @user_pertenence.network_id
        @network = Network.find_by_id(@networks_petenence_user)
        @n = @network
      else
        @notice = t('.users_controller.no_register')
      end
    end
  end
  def index
    @user = User.all
    redirect_to network_comunity_path
  end

  def info
    @user_l = User.find_by_personal_url(params[:personal_url])
    redirect_to '/404' if @user_l.nil?
    permisos = Permissioning.find_by_user_id_and_network_id(@user_l.id, current_network.id)
    @role = Role.find_by_id(permisos.role_id)
  end

  def courses
    @user_l= User.find_by_personal_url(params[:personal_url])
  end

  def friends
    @user_l = User.find_by_personal_url(params[:personal_url])
    @pending = params[:pending]
    @friends = @user_l.friends(true).reject { |u| u.roles.length == 0 }
  end

  def pendding_friends
    @user_l = current_user
    @friends = @user_l.friends(false).reject { |u| u.roles.length == 0 }

    respond_to do |format|
      format.js
    end
  end

  def dashboard
  end

  def destroy_user_with_parts
    @user = User.find_by_id(params[:id])
    unless @user.nil?
      network_user = @user.networks.first
      if current_user.id == params[:id] or (current_user.admin? and current_network == network_user)
        @user.destroy
        the_flash = { success: t('.users_controller.correct_delete') } #mensaje para el admin
      else
        the_flash = { error: t('.users_controller.canot_delete') }
      end
    else
      the_flash = { error: t('.users_controller.deleted_usr') }
    end
    
    redirect_to root_path, flash: the_flash
  end
  
  def old_courses
    @old_course_for_user = current_user.courses.where(:active_status => false)
    respond_to do |format|
      #format.html
      format.json
      format.js
    end
  end

  def acces_courses
    @course_for_user = current_user.courses.where(:active_status => true)
    respond_to do |format|
      #format.html
      format.json
      format.js
    end
  end

  def confirm
    user = User.find_by_id(params[:user_id])
    user.confirm!
    user.save!
    respond_to do |format|
      format.json
      format.js
    end
  end

  def set_password
    user = User.find_by_id(params[:user_id])
    user.password = params[:password]
    if user.save!
      last_info = user.tour_info
      pos = 3
      if last_info.length < 4
        info = last_info + '1'
      else
        info = last_info[0...pos] + "1" + last_info[pos+1..last_info.length]
      end

      user.tour_info = info
      # user.save!
      user.update_attributes(:tour_info => info)
      sign_in user, :bypass => true

    end
    respond_to do |format|
      format.json
      format.js
      format.html{redirect_to root_path, :notice => t('.users_controller.save_pwd')}
    end
  end

  def corroborate_url
    @user = User.find_by_personal_url(params[:personal_url])

    if @user == nil
      @url = true
    else
      @url = false
    end

  end

  def upload_users_a
    ###### cacha red y usuario para mandar mail de errores ####
    network = Network.find(params[:red])
    user_info = User.find_by_email("info@cursa.me") # Cambiar esto por info@cursa.me
    user_admin = user_info
    t_email = params[:t_email]

    ######### sube el archivo a la carpeta de importación de usuarios #####
    lastFile = Dir.glob("public/imports/import_users_*")
    lastFile = lastFile.sort.map{|x| x.gsub(/[^0-9]/, '')}.map{|x| x.to_i}.sort.last
    if lastFile.nil? then
      name = "import_users_1.csv"
    else
      name = "import_users_" + lastFile.succ.to_s + ".csv"
    end

    #begin
    f = File.open(params[:file].path,"r").read
    detection = CharlockHolmes::EncodingDetector.detect(f)
    unless detection[:encoding] == "utf-8"
      text = f.encode!("utf-8", detection[:encoding], :invalid => :replace)
    else
      text = f
    end
    
    path = "public/imports/" + name
    f = File.open(path,'w+')
    f.write(text)
    f.close
    ####### setea las variables del dominio ##########
    domain = params["domain"]
    subdomain = network.subdomain

    if t_email == 'confirmate'
      user_info.import(path,network,user_admin,domain,subdomain)
    else
      user_info.import_for_admin(path,network,user_admin,domain,subdomain)
    end

    @noFile = true
    @users = network.users
    respond_to do |format|
      format.html { redirect_to :back}
      format.json { render json: @users }
    end
  end

  def filter_friendship
    @user_l= User.find_by_personal_url(params[:personal_url])
    @user_l.approved_friend(current_user)
  end

  def tour_reciver
    case params[:type_route]
    when 'network'
      current_user.tour_network = true
    when 'profile'
      current_user.tour_profile = true
    when 'course'
      current_user.tour_course = true
    when 'form'
      current_user.form_before_tour = true
    end

    current_user.save
    respond_to do |f|
      f.js
    end
  end

end
