# -*- coding: utf-8 -*-
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
    user = User.find_by_personal_url(params[:personal_url])
    if current_user.id != user.id then
      redirect_to show_user(user.personal_url)
      return
    end
    group = Group.find_by_id(params[:id])
    group.update_attributes(:name => params[:name], :description => params[:description])
    redirect_to :show_groups
  end

  # DELETE /groups/1
  # DELETE /groups/1.json
  def destroy
    user = User.find_by_personal_url(params[:personal_url])
    if current_user.id != user.id
      redirect_to show_user(user)
      return
    end
    group = Group.find_by_id(params[:group_id])
    group.members_in_group.each do |member|
      member.destroy
    end
    group.delete
    redirect_to :show_groups
  end

  # GET /groups/edit
  # GET /gropus/1.json
  def edit
    @user = User.find_by_personal_url(params[:personal_url])
    if @user.id != current_user.id then
      redirect_to :root_path
      return
    else
      @group = Group.find_by_id(params[:id])
      if @group.nil? then
        # Si el grupo no existe, entonces no se puede editar
        redirect_to :show_user
        return
      end
      # Si no eres el dueño del grupo no lo puedes editar
      redirect_to :show_user if @group.user_id != @user.id
      return
    end
  end
end
