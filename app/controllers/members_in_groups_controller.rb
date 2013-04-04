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
    MembersInGroup.create(:user_id => params[:user_id],:group_id => params[:group_id])
    redirect_to :show_groups
  end

  # DELETE /members_in_groups/1
  # DELETE /members_in_groups/1.json
  def destroy
    member_in_group = MembersInGroup.find_by_user_id_and_group_id(params[:user_id],params[:group_id])
    member_in_group.delete
    redirect_to :show_groups
  end
end
