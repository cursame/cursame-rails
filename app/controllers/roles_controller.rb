class RolesController < ApplicationController
  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @roles }
    end
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    @role = Role.find(params[:id])
    @role_id_and_permission_id = RoleIdAndPermissionId.new
    @permissions = Permission.all
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @role }
    end
  end

  # GET /roles/new
  # GET /roles/new.json
  def new
    @role = Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @role }
    end
  end

  # GET /roles/1/edit
  def edit
    @role = Role.find(params[:id])
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(params[:role])
 
    respond_to do |format|
      if @role.save
        
        ActiveRecord::Base.connection.tables.map do |model|
          @bp = BasicPermiission.all
          @modul = Modul.new
          @modul.name =  model.capitalize.singularize.camelize
          @modul.role_id = @role.id
          @modul.save
                  @bp.each do |p|
                    
                     @permission = Permission.new
                     @permission.name = p.title
                     @permission.modul_id = @modul.id
                     @permission.active = true
                     @permission.save
                      
                   end
        end
        
        
        
       
        
        
          
        #format.html {notice: 'Role was successfully created.' }
        format.json
        format.js
      else
        #format.html
        format.json
        format.js
      end
    end
  end

  # PUT /roles/1
  # PUT /roles/1.json
  def update
    @role = Role.find(params[:id])

    respond_to do |format|
      if @role.update_attributes(params[:role])
        format.html { redirect_to @role, notice: 'Role was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to roles_url }
      format.json { head :no_content }
    end
  end
end
