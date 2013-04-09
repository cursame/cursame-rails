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
    @user = User.find_by_id(params[:id])
    @friendship = Friendship.new
      @friendship.user_id = current_user.id
      @friendship.friend_id = @user.id
      @friendship.accepted = false
    @friendship.save

    respond_to do |format|
      format.js
      format.json
    end

  end

  def update_friend
    @friendship = Friendship.find_by_user_id_and_friend_id(current_user.id,params[:id])
    @friendship.accepted = true
    @friendship.save
    @user = User.find(:id)
     respond_to do |format|
        format.js
        format.json
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
      redirect_to :new_friends
    else
      redirect_to :new_friends
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship = Friendship.find_by_user_id_and_friend_id(current_user.id,params[:friend_id])
    if @friendship.nil? then
      @friendship = Friendship.find_by_user_id_and_friend_id(params[:friend_id],current_user.id)
    end
    @friendship.destroy
    redirect_to :show_friends
  end
end
