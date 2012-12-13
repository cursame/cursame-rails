class BasicPermiissionsController < ApplicationController
  # GET /basic_permiissions
  # GET /basic_permiissions.json
  def index
    @basic_permiissions = BasicPermiission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @basic_permiissions }
    end
  end

  # GET /basic_permiissions/1
  # GET /basic_permiissions/1.json
  def show
    @basic_permiission = BasicPermiission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @basic_permiission }
    end
  end

  # GET /basic_permiissions/new
  # GET /basic_permiissions/new.json
  def new
    @basic_permiission = BasicPermiission.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @basic_permiission }
    end
  end

  # GET /basic_permiissions/1/edit
  def edit
    @basic_permiission = BasicPermiission.find(params[:id])
  end

  # POST /basic_permiissions
  # POST /basic_permiissions.json
  def create
    @basic_permiission = BasicPermiission.new(params[:basic_permiission])

    respond_to do |format|
      if @basic_permiission.save
        format.html { redirect_to @basic_permiission, notice: 'Basic permiission was successfully created.' }
        format.json { render json: @basic_permiission, status: :created, location: @basic_permiission }
      else
        format.html { render action: "new" }
        format.json { render json: @basic_permiission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /basic_permiissions/1
  # PUT /basic_permiissions/1.json
  def update
    @basic_permiission = BasicPermiission.find(params[:id])

    respond_to do |format|
      if @basic_permiission.update_attributes(params[:basic_permiission])
        format.html { redirect_to @basic_permiission, notice: 'Basic permiission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @basic_permiission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basic_permiissions/1
  # DELETE /basic_permiissions/1.json
  def destroy
    @basic_permiission = BasicPermiission.find(params[:id])
    @basic_permiission.destroy

    respond_to do |format|
      format.html { redirect_to basic_permiissions_url }
      format.json { head :no_content }
    end
  end
end
