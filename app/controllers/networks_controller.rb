# coding: utf-8
class NetworksController < ApplicationController
  # GET /networks
  # GET /networks.json
  # before_filter :filter_user_network_wed
  skip_before_filter :authenticate_user!, :only => [:network_mask, :new, :create, :awaiting_confirmation, :alertmethod, :network_search]
  before_filter :filter_user_network_wed
  skip_before_filter :filter_user_network_wed, :only => [:network_mask, :new, :create, :awaiting_confirmation, :network_search]
  helper_method :ko_net

  def index
    @networks = Network.all
    def network_each
      @networks.each do |network|
        network.name
        network.subdomain
      end
    end

  end

  def alertmethod
    respond_to do |format|
      format.html
      format.json
    end
  end


  def ko_net
    if network_member == nil
      permissions = Permissioning.where(:user_id => current_user.id)
      ############## encontrando permissionings
      if permissions != nil
        ############ validando contador de permissionings
        if permissions.count == 1
          @permission = permissions.first
          ####### encontrando redes
          @find_network = Network.find(@permission.network_id)
          ###### validando que la red no sea nula para redirigir
          if @find_network != nil
            ####### redirecciona la red
            @net = @find_network
          end
        else
          ####### se deja abierto para los permisos que estan pendientes
        end
      end
    end
  end

  # GET /networks/1
  # GET /networks/1.json
  def show
    hide_course_publications = current_network.find_setting(:hide_course_publications_in_main_wall)
    if !hide_course_publications.nil? && hide_course_publications.value = 't'
      @wall = current_network.walls.where(public: true).paginate(per_page: 20, page: params[:page]).order('walls.created_at DESC')
    else
      @wall = current_network.walls.search(params[:search], params[:id]).paginate(:per_page => 20, :page => params[:page]).order('walls.created_at DESC')
    end

    if request.xhr? && (params[:page].to_i > 1)
      respond_to { |format| format.js }
    else
      respond_to do |format|
        format.html { render stream: true }
        format.json { render json: @network }
      end
    end
  end


  # GET /networks/new
  # GET /networks/new.json
  def new
    @network = Network.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @network }
    end
  end

  # GET /networks/1/edit
  def edit
    @network = Network.find(params[:id])
  end

  # POST /networks
  # POST /networks.json
  def create
    @network = Network.new(params[:network])
    @user = User.new(params[:user])
    @call_user = @network.users.last

    respond_to do |format|
      if @network.save
        @permissioning = Permissioning.find_by_user_id_and_network_id(@call_user.id ,@network.id)
        @permissioning.role_id = "1"
        @permissioning.save
        if  @permissioning.save
        else
        end

        format.json { render json: @network, status: :created, location: @network }
        format.js
      else
        format.json { render json: @network.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /networks/1
  # PUT /networks/1.json
  def update
    @network = Network.find(params[:id])

    respond_to do |format|
      if @network.update_attributes(params[:network])
        format.html { redirect_to :back, flash: { success: t('.networks.messages.update.success') } }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @network.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /networks/1
  # DELETE /networks/1.json
  def destroy
    @network = Network.find(params[:id])
    @network.destroy

    respond_to do |format|
      format.html { redirect_to networks_url }
      format.json { head :no_content }
    end
  end

  def filter_user_network_wed
    filtrati
  end

  def network_mask
  end

  def network_search
    @networks = Network.all
    network = []
    @networks.each do |net|
      @lader = I18n.transliterate("#{net.name}")
      network.push( { name: "#{net.name}", subdomain: "#{net.subdomain}", simplify: "#{@lader}".downcase!})
    end

    render :json => { message: 'networks.messages.search.network', network: network}, :callback => params[:callback]
  end

  def awaiting_confirmation
    user = User.find_by_id params[:user_id]
    return redirect_to root_path if user.nil? || user.confirmed?
    respond_to do |format|
      format.html { render :layout => 'sessions' }
    end
  end

  def find_user
    @search_changes = params[:activiesearch].downcase
    docificate_search_changes = I18n.transliterate("#{@search_changes}")
    @users = current_network.users.search(docificate_search_changes).paginate(:per_page => 50, :page => params[:page]).order('users.first_name')
    respond_to do |format|
      format.js
    end
  end

  def wall_filter
    ##### detecta los tipos de publicación para procesarlos mediante un filtro ######
    @typeforfilter = params[:typeforfilter]
    @responds = true if  params[:responds] == "true"
    @responds = false if  params[:responds] == "false"
    @fo_format = true if params[:fo_format].nil?
    @fo_format = false if !params[:fo_format].nil?
    @paginate = params[:paginate]

    p @typeforfilter
    p @responds
    responds_true = []
    responds_false = []

    ######## inicia el acceso a los cursos del usuario #######
    current_user.courses.each do |c|
      @member = MembersInCourse.find_by_course_id_and_user_id(c.id,current_user.id)
      p @member.owner
      case
      when @typeforfilter == 'Delivery'
        ####################################### inicia el filtro de deliveries ########################################
        case
        when @responds && @member.owner
          c.deliveries.each do |d|
            if d.assignments.count != 0
              responds_true.push(d.id)
            end
          end
        when @responds && (@member.owner.nil? or !@member.owner)
          c.deliveries.each do |d|
            user_delivery = Assignment.where(:user_id => current_user.id, :delivery_id => d.id)
            if user_delivery.count != 0
              responds_false.push(d.id)
            end
          end
        when !@responds  && @member.owner
          c.deliveries.each do |d|
            if d.assignments.count == 0
              responds_false.push(d.id)
            end
          end
        when !@responds  && (@member.owner.nil? or !@member.owner)
          c.deliveries.each do |d|
            user_delivery = Assignment.where(:user_id => current_user.id, :delivery_id => d.id)
            if user_delivery.count == 0
              responds_false.push(d.id)
            end
          end
        end
        ####################################### finaliza el filtro de delivereis ######################################
      when @typeforfilter == 'Survey'
        ####################################### inicia filtro de survey ##############################################

        ##### se accesa a todos los cursos
        case
        ###### se validan las variables que buscamos
        when @responds && @member.owner
          c.surveys.each do |s|
            if s.user_surveys.count != 0
              responds_true.push(s.id)
            end
          end
        when @responds && (@member.owner.nil? or !@member.owner)
          c.surveys.each do |s|
            user_survey= UserSurvey.where(:survey_id => s.id, :user_id => current_user.id)
            if user_survey.count != 0
              responds_true.push(s.id)
            end
          end
        when !@responds && (@member.owner.nil? or !@member.owner)
          c.surveys.each do |s|
            user_survey= UserSurvey.where(:survey_id => s.id, :user_id => current_user.id)
            if user_survey.count == 0
              responds_false.push(s.id)
            end
          end
        when !@responds && @member.owner
          c.surveys.each do |s|
            if s.user_surveys.count == 0
              responds_false.push(s.id)
            end
          end
        end
      end
      ##################################### finaliza filtro de survey ##########################################
    end
    #################### finaliza el acceso a los datos de los curos del usuario #####################
    #################### se generan las epecificaicones del wall #############################
    @operator = responds_true + responds_false
    @wall = Wall.where(:publication_id=>@operator, :publication_type => "#{@typeforfilter}").paginate(:per_page => 5, :page => params[:page]).order('created_at DESC')


    respond_to do |format|
      format.js
    end
  end



  # sesion expire
  def expire_session
    @status = user_signed_in?
    if @status
      current_user.online = false
      current_user.save!
      PrivatePub.publish_to("/messages/chat_notifications",
                            userId: current_user.id,
                            online: false
                            )
      sign_out(current_user)
    end

    respond_to do |format|
      format.js
      format.json
    end
  end
end
