class UsersNetworksNetworksUsersController < ApplicationController
  # GET /users_networks_networks_users
  # GET /users_networks_networks_users.json
  def index
    @users_networks_networks_users = UsersNetworksNetworksUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users_networks_networks_users }
    end
  end

  # GET /users_networks_networks_users/1
  # GET /users_networks_networks_users/1.json
  def show
    @users_networks_networks_user = UsersNetworksNetworksUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @users_networks_networks_user }
    end
  end

  # GET /users_networks_networks_users/new
  # GET /users_networks_networks_users/new.json
  def new
    @users_networks_networks_user = UsersNetworksNetworksUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @users_networks_networks_user }
    end
  end

  # GET /users_networks_networks_users/1/edit
  def edit
    @users_networks_networks_user = UsersNetworksNetworksUser.find(params[:id])
  end

  # POST /users_networks_networks_users
  # POST /users_networks_networks_users.json
  def create
    @users_networks_networks_user = UsersNetworksNetworksUser.new(params[:users_networks_networks_user])

    respond_to do |format|
      if @users_networks_networks_user.save
        format.html { redirect_to @users_networks_networks_user, notice: 'Users networks networks user was successfully created.' }
        format.json { render json: @users_networks_networks_user, status: :created, location: @users_networks_networks_user }
      else
        format.html { render action: "new" }
        format.json { render json: @users_networks_networks_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users_networks_networks_users/1
  # PUT /users_networks_networks_users/1.json
  def update
    @users_networks_networks_user = UsersNetworksNetworksUser.find(params[:id])

    respond_to do |format|
      if @users_networks_networks_user.update_attributes(params[:users_networks_networks_user])
        format.html { redirect_to @users_networks_networks_user, notice: 'Users networks networks user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @users_networks_networks_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_networks_networks_users/1
  # DELETE /users_networks_networks_users/1.json
  def destroy
    @users_networks_networks_user = UsersNetworksNetworksUser.find(params[:id])
    @users_networks_networks_user.destroy

    respond_to do |format|
      format.html { redirect_to users_networks_networks_users_url }
      format.json { head :no_content }
    end
  end
end
