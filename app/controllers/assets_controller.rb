class AssetsController < ApplicationController
  # GET /assets
  # GET /assets.json
  def index
    @assets = Asset.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assets }
    end
  end

  # GET /assets/1
  # GET /assets/1.json
  def show
    @asset = Asset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @asset }
    end
  end

  # GET /assets/new
  # GET /assets/new.json
  def new
    @asset = Asset.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @asset }
    end
  end

  # GET /assets/1/edit
  def edit
    @asset = Asset.find(params[:id])
  end

  # POST /assets
  # POST /assets.json
  #public
  def create
    @asset = Asset.new(params[:asset])
    @asset.user_id = params[:user_id]
    @asset.save!
    respond_to do |format|
      format.js
    end
  end

  # PUT /assets/1
  # PUT /assets/1.json
  def update
    @asset = Asset.find(params[:id])

    respond_to do |format|
      if @asset.update_attributes(params[:asset])
        format.html { redirect_to @asset, notice: 'Asset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @asset = Asset.find_by_id params[:id]
    if @asset.nil?
      @flash =  { type: 'error', message: 'assets.messages.delete.non_existent' }
    elsif @asset.user == current_user
      @asset.destroy
      @flash = (@asset.destroyed?) ? { type: 'success', message: 'assets.messages.delete.success' } : { type: 'error', message: 'assets.messages.delete.error' }
    else
      @flash = { type: 'error', message: 'assets.messages.delete.not_an_owner' }
    end
    respond_to { |format| format.js }
  end

end
