class NetworksController < ApplicationController
  # GET /networks
  # GET /networks.json
  # before_filter :filter_user_network_wed
  skip_before_filter :authenticate_user!, :only => [:network_mask, :new, :create]
  before_filter :filter_user_network_wed
  skip_before_filter :filter_user_network_wed, :only => [:network_mask, :new, :create]
  def index
    @networks = Network.all
    def network_each
     @networks.each do |network|
        network.name
        network.subdomain
     end
   end
   
  end

  # GET /networks/1
  # GET /networks/1.json
  def show
    @user = current_user
    @course = Course.new
    @delivery = Delivery.new

    #==== Areas de evaluación ====#
    @areas_of_evaluation = AreasOfEvaluation.new
    areas_of_evaluations = @delivery.areas_of_evaluations.build

    #==== Assets ====#
    @asset = Asset.new
    assets = @delivery.assets.build


    @course_count = Course.count
    @courses = Course.where(:network_id => current_network.id, :active_status => true).limit(7)
    #@courses = current_user.members_in_courses.limit(7)
    @ccc = current_user.courses.where(:network_id => current_network.id)  
    @count_course_iam_member =  @ccc.where(:active_status => true).count

    @count_course_iam_member_and_owner = current_user.members_in_courses.where(:owner => true, :network_id => current_network.id, :active_status => true).count

    @network = Network.find_by_subdomain!(request.subdomain)
    @search = params[:search]
    @id = params[:id]
    @page = params[:page].to_i
    # @wall = current_network.walls.where('public = ? OR user_id = ?',true,current_user.id).search(@search,@id).order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    @wall = current_network.walls.search(@search,@id).order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
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
         
        format.html { redirect_to :back , notice: 'Network was successfully created.' }
        format.json { render json: @network, status: :created, location: @network }
        format.js
      else
        format.html { render action: "new" }
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
  
  def network_comunity
      @network_users = current_network.users      
  end
    
end
