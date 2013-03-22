class FriendshipsController < ApplicationController
  # GET /friendships/1
  # GET /friendships/1.json
  def show
    @user = User.find_by_personal_url(params[:personal_url])
    if @user.nil? then
      redirect_to root_path
    else
      @all_friends = @user.all_friends
    end
  end

  # GET /friendships/new
  # GET /friendships/new.json
  def new
    @user = User.find_by_personal_url(params[:personal_url])
    if @user.nil? then
      redirect root_path
    else
      @users = @user.possible_friends
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
