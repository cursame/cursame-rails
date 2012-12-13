class ModulsController < ApplicationController
  # GET /moduls
  # GET /moduls.json
  def index
    @moduls = Modul.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moduls }
    end
  end

  # GET /moduls/1
  # GET /moduls/1.json
  def show
    @modul = Modul.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @modul }
    end
  end

  # GET /moduls/new
  # GET /moduls/new.json
  def new
    @modul = Modul.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @modul }
    end
  end

  # GET /moduls/1/edit
  def edit
    @modul = Modul.find(params[:id])
  end

  # POST /moduls
  # POST /moduls.json
  def create
    @modul = Modul.new(params[:modul])

    respond_to do |format|
      if @modul.save
        format.html { redirect_to @modul, notice: 'Modul was successfully created.' }
        format.json { render json: @modul, status: :created, location: @modul }
      else
        format.html { render action: "new" }
        format.json { render json: @modul.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /moduls/1
  # PUT /moduls/1.json
  def update
    @modul = Modul.find(params[:id])

    respond_to do |format|
      if @modul.update_attributes(params[:modul])
        format.html { redirect_to @modul, notice: 'Modul was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @modul.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moduls/1
  # DELETE /moduls/1.json
  def destroy
    @modul = Modul.find(params[:id])
    @modul.destroy

    respond_to do |format|
      format.html { redirect_to moduls_url }
      format.json { head :no_content }
    end
  end
  
  def basic_permissions
    ["edit", "create","update","show","insert","destroy","suspend"]
  end
  
end
