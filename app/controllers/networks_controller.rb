class NetworksController < ApplicationController
  # GET /networks
  # GET /networks.json
  before_filter :register_member
  skip_before_filter :register_member, :only => [:index, :new]
  
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
    @network = Network.find_by_subdomain!(request.subdomain)
    @comments = @network.comments 
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
  
  def register_member
    if member
    member.each do |member|
       @memberid = member.user_id 
       @user = User.find_by_id(@memberid)
     end
        if @memberid == current_user.id
           return false
        else
           redirect_to new_networks_user_path
        end
    end
  end
  
  
end
