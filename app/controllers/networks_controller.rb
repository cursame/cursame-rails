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

    if request.xhr?
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.html # show.html.erb
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
    search_reqfs = params[:search_reqfs]
    user = current_user
    network = current_network
    
    if search_reqfs then
      @inverse_friends = user.inverse_friendships
      @inverse_friends_array = Array.new
      @inverse_friends = @inverse_friends.each {
        |friendship|
        if not(friendship.accepted) and (friendship.user.id.to_s == search_reqfs) then
          @inverse_friends_array.push([friendship.user, "accept_request"])
        end
      }
      
      @network_users = @inverse_friends_array
    else
      @possible_friends = user.possible_friends(network)
      @possible_friends = @possible_friends.map{|user| [user,"not_friend_request"]}
    
      @friends = user.friendships
      @friends_array = Array.new
      @friends = @friends.each {
        |friendship|
        if friendship.accepted then
          @friends_array.push([friendship.friend, "friend"])
        else
          @friends_array.push([friendship.friend,"friend_requested"])
        end
      }
      
      @inverse_friends = user.inverse_friendships
      @inverse_friends_array = Array.new
      @inverse_friends = @inverse_friends.each {
        |friendship|
        if friendship.accepted then
          @inverse_friends_array.push([friendship.user, "friend"])
        else
          @inverse_friends_array.push([friendship.user, "accept_request"])
        end
      }
      
      @network_users = @possible_friends + @friends_array + @inverse_friends_array
    end

    @network_users = @network_users.sort { |x,y| x[0].to_s <=> y[0].to_s }
    @network_users = @network_users.reject {|array| array[0].nil? }
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
  
  # sesion expire
   def expire_session
       puts "se ha ingresado al metodo"
       @status = user_signed_in?
       @timer = Time.now
       @minute = 5
       #puts @status
        respond_to do |format|
           format.js
           format.json
         end
   end

 
end
