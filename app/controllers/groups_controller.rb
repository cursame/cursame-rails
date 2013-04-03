class GroupsController < ApplicationController

  # GET /groups/1
  # GET /groups/1.json
  def show
    @user = User.find_by_personal_url(params[:personal_url])
    @groups = @user.groups
    @owner = current_user.id == @user.id
    if @owner then
      @friends = @user.friends(true)
    end
  end

  # GET /groups/new
  # GET /groups/new.json
  def new
    @user = User.find_by_personal_url(params[:personal_url])
    if current_user.id != @user.id then
      redirect_to root_path
    end
    if @user.nil? then
      redirect_to root_path
    end
  end

  # POST /groups
  # POST /groups.json
  def create
    @group = Group.create(:user_id => current_user.id, :name => params[:name],
                   :description => params[:description])
    if @group.save then
      redirect_to :show_groups
    else
      redirect_to :show_groups
    end
  end

  # PUT /groups/1
  # PUT /groups/1.json
  def update
    MembersInGroup.create(:user_id => params[:user_id],:group_id => params[:group_id])
    redirect_to :new_group
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    group = Group.find_by_id(params[:group_id])
    group.members_in_group.each do |member|
      member.destroy
    end
    group.delete
    redirect_to :new_group
  end
end
