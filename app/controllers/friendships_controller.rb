class FriendshipsController < ApplicationController
  # GET /friendships/1
  # GET /friendships/1.json
  def show
    @user = User.find_by_personal_url(params[:personal_url])
    @owner = current_user.id == @user.id
    if @user.nil?
      redirect_to root_path
    elsif !@user.friends?(current_user)
      redirect_to root_path
    else
      @all_friends = @user.all_friends
    end
  end

  # GET /friendships/new
  # GET /friendships/new.json
  def new
    @user = User.find_by_personal_url(params[:personal_url])
    if current_user.id != @user.id then
      redirect_to root_path
    end
    if @user.nil? then
      redirect_to root_path
    else
      @users = @user.possible_friends(current_network)
    end
  end
  # GET /friendships/create_friend
  # GET /friendships/create_friend.json
  def create_friend
    user = current_user
    @user = User.find_by_id(params[:id])
    @friendship = Friendship.find_by_friend_id_and_user_id(user.id,@user.id)
    if @friendship.nil? then
      @friendship = Friendship.new
      @friendship.user_id = user.id
      @friendship.friend_id = @user.id
      @friendship.accepted = false
      @friendship.save

      @typed = @friendship.class.to_s
      @az = @friendship
      activation_activity
    end

    respond_to do |format|
      format.js
      format.json
    end

    begin
      permissioning = Permissioning.find_by_user_id_and_network_id(user.id, current_network.id)
      mixpanel_properties = { 
        'Network'   => current_network.name.capitalize,
        'Subdomain' => current_network.subdomain,
        'Role'      => permissioning.role.title.capitalize
      }
      MixpanelTrackerWorker.perform_async user.id, 'Friend Requests', mixpanel_properties
    rescue
      puts "\e[1;31m[ERROR]\e[0m error sending data to mixpanel"
    end

  end

  def update_friend
    user = current_user
    @friendship = Friendship.find_by_user_id_and_friend_id(params[:id],user)
    @friendship.accepted = true
    @friendship.save
    @user = User.find(params[:id])
    @f = params[:id]
    
    respond_to do |format|
      format.js
      format.json
    end
    
    begin
      permissioning = Permissioning.find_by_user_id_and_network_id(user.id, current_network.id)
      mixpanel_properties = { 
        'Network'   => current_network.name.capitalize,
        'Subdomain' => current_network.subdomain,
        'Role'      => permissioning.role.title.capitalize
      }
      MixpanelTrackerWorker.perform_async user.id, 'Accepted Friend Requests', mixpanel_properties
    rescue
      puts "\e[1;31m[ERROR]\e[0m error sending data to mixpanel"
    end

  end



  # PUT /friendships
  # PUT /friendships.json
  def update
    @friendship = Friendship.find_by_user_id_and_friend_id(current_user.id,params[:friend_id])
    if @friendship.nil? then
      @friendship = Friendship.find_by_user_id_and_friend_id(params[:friend_id],current_user.id)
    end
    @friendship.update_attributes(:accepted => true)
    redirect_to :show_friends
  end

  # POST /friendships
  # POST /friendships.json
  def create
    @friendship = Friendship.create(:user_id => current_user.id, :friend_id => params[:friend_id], :accepted => false)
    if @friendship.save
      @az = @friendship
      @typed = @friendship.class.to_s
      activation_activity
      redirect_to :new_friends
    else
      redirect_to :new_friends
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship = Friendship.find_by_user_id_and_friend_id(params[:id],current_user.id)
    @friendship ||= Friendship.find_by_user_id_and_friend_id(current_user.id,params[:id])
    unless @friendship.nil?
      @friendship.destroy
      redirect_to :back, flash: { success: t('.friendships_controller.delete_usr') }
    else
      redirect_to :back, flash: { error: t('.friendships_controller.error_usr') }
    end
  end
end
