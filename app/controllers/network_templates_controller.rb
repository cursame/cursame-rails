class NetworkTemplatesController < ApplicationController
  # GET /network_templates
  # GET /network_templates.json
  def index
    @network_templates = NetworkTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @network_templates }
    end
  end

  # GET /network_templates/1
  # GET /network_templates/1.json
  def show
    @network_template = NetworkTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @network_template }
    end
  end

  # GET /network_templates/new
  # GET /network_templates/new.json
  def new
    @network_template = NetworkTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @network_template }
    end
  end

  # GET /network_templates/1/edit
  def edit
    @network_template = NetworkTemplate.find(params[:id])
  end

  # POST /network_templates
  # POST /network_templates.json
  def create
    @network_template = NetworkTemplate.new(params[:network_template])

    respond_to do |format|
      if @network_template.save
        format.html { redirect_to @network_template, notice: 'Network template was successfully created.' }
        format.json { render json: @network_template, status: :created, location: @network_template }
      else
        format.html { render action: "new" }
        format.json { render json: @network_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /network_templates/1
  # PUT /network_templates/1.json
  def update
    @network_template = NetworkTemplate.find(params[:id])

    respond_to do |format|
      if @network_template.update_attributes(params[:network_template])
        format.html { redirect_to @network_template, notice: 'Network template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @network_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /network_templates/1
  # DELETE /network_templates/1.json
  def destroy
    @network_template = NetworkTemplate.find(params[:id])
    @network_template.destroy

    respond_to do |format|
      format.html { redirect_to network_templates_url }
      format.json { head :no_content }
    end
  end
end
