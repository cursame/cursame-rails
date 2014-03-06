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
                      puts "****************** se ha encontrado una red a la cual seras redirigido ************"
                       #render do |page| 
                        # page.js{alertmethod_path} 
                       #end
                      @net = @find_network
                   end
               else
                ####### se deja abierto para los permisos que estan pendientes
                puts "*************** demasiados *****************"  
             end
        end
      end
  end
 
  # GET /networks/1
  # GET /networks/1.json
  def show
    @user = current_user
    @course = Course.new
    @delivery = Delivery.new
    @show_course_expired = params[:course_expired]

    #==== Areas de evaluación ====#
    @areas_of_evaluation = AreasOfEvaluation.new
    areas_of_evaluations = @delivery.areas_of_evaluations.build

    #==== Assets ====#
    @asset = Asset.new
    assets = @delivery.assets.build


    @course_count = Course.count
    @courses = current_user.members_in_courses.limit(7)
    @ccc = current_user.courses.where(:network_id => current_network.id)
    @count_course_iam_member =  MembersInCourse.where(:user_id => current_user.id, :accepted => true, :active_status => true).count

    @count_course_iam_member_and_owner = current_user.members_in_courses.where(:owner => true, :network_id => current_network.id, :active_status => true).count

    # @network = Network.find_by_subdomain(request.subdomain)
    # if @network.nil? then
    #   @network = Network.find_by_subdomain!(request.subdomain.split(".").last)
    # end

    @network=current_network
    @search = params[:search]
    @id = params[:id]
    id_search = params[:id_search]
    @page = params[:page].to_i
    
    if id_search.nil?
      @wall = current_network.walls.search(@search, @id).paginate(:per_page => 10, :page => params[:page]).order('walls.created_at DESC')   
    else
      @wall = current_network.walls.search(@search, id_search).paginate(:per_page => 10, :page => params[:page]).order('walls.created_at DESC')   
    end

    

    # if request.xhr?
    if request.xhr? && @page > 1
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.html {render stream: true}
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
            puts "----------------------"
            puts @permissioning
            puts "----------------------"
             @permissioning.role_id = "1"
             @permissioning.save
         if  @permissioning.save
           puts "permisos guardados correctamente"
         else
           puts "permisos no guardados correctamente"
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
        format.html { redirect_to :back, notice: 'Network was successfully updated.' }
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
          network.push(
             { name: "#{net.name}",
              subdomain: "#{net.subdomain}",
              simplify: "#{@lader}".downcase!}
          )
        end
     
   
     render :json => {message:"Buscador de Redes", network: network}, :callback => params[:callback]
          
     
  end

  def network_comunity
  @user_l= current_user
  @friends = @user_l.friends(false) + @user_l.friends(true)
  
   respond_to do |f|
    f.html
   end

  end

  def all_user_in_network_where_not_my_friends
  @user_l= current_user

   @a = current_network.users

   @r = @user_l.friends(false) + @user_l.friends(true) + [current_user]

   @v = @a - @r

   @friends = @v
  respond_to do |f|
    f.js
  end

  end
  
  def awaiting_confirmation
    personal_url = params[:personal_url]
    user = User.find_by_personal_url(personal_url)
    if (user.nil?)
      redirect_to root_path
    elsif (user.confirmed?)
      redirect_to root_path
    else
      @user_inactive = user
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
          #puts @member
          case 
            ###### se validan las variables que buscamos
             when @responds && @member.owner
                #puts "owner"
               c.surveys.each do |s|
                if s.user_surveys.count != 0
                  #puts "#{s.state} #{s.user_surveys.count} #{s.id}"
                  responds_true.push(s.id)
                end
               end
             when @responds && (@member.owner.nil? or !@member.owner)
              #puts "no owner"
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
              #puts "no owner"
             when !@responds && @member.owner
              c.surveys.each do |s|
                if s.user_surveys.count == 0
                  #puts "#{s.state} #{s.user_surveys.count} #{s.id}"
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
    @wall = Wall.where(:publication_id=>@operator, :publication_type => "#{@typeforfilter}").paginate(:per_page => 15, :page => params[:page]).order('created_at DESC')


    respond_to do |format|
      format.js
    end
  end



  # sesion expire
   def expire_session
       puts "se ha ingresado al metodo"
       @status = user_signed_in?
       puts "esta logueado es #{@status}"
       puts "se procede a candelar la session de usuario #{@status}"
       if @status
           current_user.online = false
           current_user.save!
           PrivatePub.publish_to("/messages/chat_notifications",
                                  userId: current_user.id,
                                  online: false
                                )
           sign_out(current_user) 
       end
       #puts @status
        respond_to do |format|
           format.js
           format.json
         end
   end

 
end
