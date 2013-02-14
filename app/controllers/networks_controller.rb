class NetworksController < ApplicationController
  # GET /networks
  # GET /networks.json
  # before_filter :filter_user_network_wed
  skip_before_filter :authenticate_user!, :only => [:network_mask]
  
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
    @survey = Survey.new
    
    #==== Areas de evaluación ====#
    @areas_of_evaluation = AreasOfEvaluation.new
    areas_of_evaluations = @delivery.areas_of_evaluations.build

    #==== Assets ====#
    @asset = Asset.new
    assets = @delivery.assets.build


    @course_count = Course.count
    @courses = current_user.members_in_courses.limit(7)
    @ccc = current_user.courses.where(:network_id => current_network.id)  
    @count_course_iam_member =  @ccc.count

    @count_course_iam_member_and_owner = current_user.members_in_courses.where(:owner => true, :network_id => current_network.id).count

    @network = Network.find_by_subdomain!(request.subdomain)
    #@comments = @network.comments
    @wall = Wall.all

    # TODO aqui hay que hacer una especie de merge para que se pueda paginar el timeline de alguna manera
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @network }
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

    respond_to do |format|
      if @network.save
         @permissioning = Permissioning.new
         @permissioning.user_id = current_user.id
         @permissioning.role_id = 1
         @permissioning.network_id = @network.id
         @permissioning.save
         
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
    network_member
  end
  
  def network_mask
  end
    
end
