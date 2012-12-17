class RoleIdAndPermissionIdsController < ApplicationController
  # GET /role_id_and_permission_ids
  # GET /role_id_and_permission_ids.json
  def index
    @role_id_and_permission_ids = RoleIdAndPermissionId.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @role_id_and_permission_ids }
    end
  end

  # GET /role_id_and_permission_ids/1
  # GET /role_id_and_permission_ids/1.json
  def show
    @role_id_and_permission_id = RoleIdAndPermissionId.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @role_id_and_permission_id }
    end
  end

  # GET /role_id_and_permission_ids/new
  # GET /role_id_and_permission_ids/new.json
  def new
    @role_id_and_permission_id = RoleIdAndPermissionId.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @role_id_and_permission_id }
    end
  end

  # GET /role_id_and_permission_ids/1/edit
  def edit
    @role_id_and_permission_id = RoleIdAndPermissionId.find(params[:id])
  end

  # POST /role_id_and_permission_ids
  # POST /role_id_and_permission_ids.json
  def create
    @role_id_and_permission_id = RoleIdAndPermissionId.new(params[:role_id_and_permission_id])

    respond_to do |format|
      if @role_id_and_permission_id.save
        #format.html {  notice: 'Role id and permission was successfully created.' }
        format.json
        format.js
      else
        #format.html 
        format.json
        format.js
      end
    end
  end

  # PUT /role_id_and_permission_ids/1
  # PUT /role_id_and_permission_ids/1.json
  def update
    @role_id_and_permission_id = RoleIdAndPermissionId.find(params[:id])
    respond_to do |format|
      if @role_id_and_permission_id.update_attributes(params[:role_id_and_permission_id])
        format.html { redirect_to @role_id_and_permission_id, notice: 'Role id and permission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @role_id_and_permission_id.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /role_id_and_permission_ids/1
  # DELETE /role_id_and_permission_ids/1.json
  def destroy
    @role_id_and_permission_id = RoleIdAndPermissionId.find(params[:id])
    @role_id_and_permission_id.destroy

    respond_to do |format|
      format.html { redirect_to role_id_and_permission_ids_url }
      format.json { head :no_content }
    end
  end
end
