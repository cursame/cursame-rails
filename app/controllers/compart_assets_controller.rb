class CompartAssetsController < ApplicationController
  # GET /compart_assets
  # GET /compart_assets.json
  def index
    @compart_assets = CompartAsset.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @compart_assets }
    end
  end

  # GET /compart_assets/1
  # GET /compart_assets/1.json
  def show
    @compart_asset = CompartAsset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @compart_asset }
    end
  end

  # GET /compart_assets/new
  # GET /compart_assets/new.json
  def new
    @compart_asset = CompartAsset.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @compart_asset }
    end
  end

  # GET /compart_assets/1/edit
  def edit
    @compart_asset = CompartAsset.find(params[:id])
  end

  # POST /compart_assets
  # POST /compart_assets.json
  def create
    @compart_asset = CompartAsset.new(params[:compart_asset])

    respond_to do |format|
      if @compart_asset.save
        format.html { redirect_to @compart_asset, notice: 'Compart asset was successfully created.' }
        format.json { render json: @compart_asset, status: :created, location: @compart_asset }
      else
        format.html { render action: "new" }
        format.json { render json: @compart_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /compart_assets/1
  # PUT /compart_assets/1.json
  def update
    @compart_asset = CompartAsset.find(params[:id])

    respond_to do |format|
      if @compart_asset.update_attributes(params[:compart_asset])
        format.html { redirect_to @compart_asset, notice: 'Compart asset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @compart_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compart_assets/1
  # DELETE /compart_assets/1.json
  def destroy
    @compart_asset = CompartAsset.find(params[:id])
    @compart_asset.destroy

    respond_to do |format|
      format.html { redirect_to compart_assets_url }
      format.json { head :no_content }
    end
  end
end
