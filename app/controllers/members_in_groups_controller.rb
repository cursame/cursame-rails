class MembersInGroupsController < ApplicationController
  # GET /members_in_groups
  # GET /members_in_groups.json
  def index
    @members_in_groups = MembersInGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members_in_groups }
    end
  end

  # GET /members_in_groups/1
  # GET /members_in_groups/1.json
  def show
    @members_in_group = MembersInGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @members_in_group }
    end
  end

  # GET /members_in_groups/new
  # GET /members_in_groups/new.json
  def new
    @members_in_group = MembersInGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @members_in_group }
    end
  end

  # GET /members_in_groups/1/edit
  def edit
    @members_in_group = MembersInGroup.find(params[:id])
  end

  # POST /members_in_groups
  # POST /members_in_groups.json
  def create
    @members_in_group = MembersInGroup.new(params[:members_in_group])

    respond_to do |format|
      if @members_in_group.save
        format.html { redirect_to @members_in_group, notice: 'Members in group was successfully created.' }
        format.json { render json: @members_in_group, status: :created, location: @members_in_group }
      else
        format.html { render action: "new" }
        format.json { render json: @members_in_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /members_in_groups/1
  # PUT /members_in_groups/1.json
  def update
    @members_in_group = MembersInGroup.find(params[:id])

    respond_to do |format|
      if @members_in_group.update_attributes(params[:members_in_group])
        format.html { redirect_to @members_in_group, notice: 'Members in group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @members_in_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members_in_groups/1
  # DELETE /members_in_groups/1.json
  def destroy
    @members_in_group = MembersInGroup.find(params[:id])
    @members_in_group.destroy

    respond_to do |format|
      format.html { redirect_to members_in_groups_url }
      format.json { head :no_content }
    end
  end
end
