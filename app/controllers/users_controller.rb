class UsersController < ApplicationController
  def show
    @user = User.find_by_personal_url(params[:personal_url])
    #helper methods in aplication controller
    pertenence!
    links
    current_friend
    validate_friend
    current_user_friends
    @friend = UserFriends.new     
  end
  
  def current_user_friends
    @pending_relarionships_user_one = UserFriends.find_by_friend_one_and_status_friendship( @user.id, 2)
    @pending_relarionships_user_two = UserFriends.find_by_friend_two_and_status_friendship( @user.id, 2)
     if  @pending_relarionships_user_one != nil
        @relation_one = @pending_relarionships_user_one
        @user_one = User.find(@pending_relarionships_user_one.friend_one)
        @user_two = User.find(@pending_relarionships_user_one.friend_two)
      end
      if @pending_relarionships_user_two != nil
        @relation_two = @pending_relarionships_user_two
        @user_one_two = User.find(@pending_relarionships_user_two.friend_one)
        @user_two_two = User.find(@pending_relarionships_user_two.friend_two)      
      end
      
      
  end
  
  def waiting_friends
    
    @user = current_user
    @pending_relarionships_user_one = UserFriends.find_by_friend_one_and_status_friendship( @user.id, 1)
    @pending_relarionships_user_two = UserFriends.find_by_friend_two_and_status_friendship( @user.id, 1)   
    
    if  @pending_relarionships_user_one != nil
      @relation_one = @pending_relarionships_user_one
      @user_one = User.find(@pending_relarionships_user_one.friend_one)
      @user_two = User.find(@pending_relarionships_user_one.friend_two)
    end
    if @pending_relarionships_user_two != nil
      @relation_two = @pending_relarionships_user_two
      @user_one_two = User.find(@pending_relarionships_user_two.friend_one)
      @user_two_two = User.find(@pending_relarionships_user_two.friend_two)      
    end
  end
  
 def pertenence!
   
     @user_id = @user.id
     @user_pertenence = NetworksUsers.find_by_user_id(@user_id)
     if @user_pertenence != nil
     @networks_petenence_user = @user_pertenence.network_id
     @network = Network.find_by_id(@networks_petenence_user)
     @n = @network
     end
     
     @notice = "no estas inscrito en ninguna red"
     
 end
 
 def friend
    @friend = UserFriends.new(params[:user_friend])
    @friend.friend_one = current_user.id
    @friend.friend_two = current_friend.id   
    @friend.status_friendship = 1
    @friend.save!
   respond_to do |format|
    if @friend.save
        format.html{ redirect_to :back, :notice => "amigo agregado correctamente esperando que te acepte"}
        format.json { render json: @friend, status: :created, location: @friend }       
        format.js
     else
        format.html{ redirect_to :back, :notice => "tu amigo no ha sido agregado"}
        format.json { render json: @friend.errors, status: :unprocessable_entity }
        format.js
    end
  end            
 end
 
 def ufriend
   @friend  = UserFriends.find(params[:id])  
   @friend.status_friendship = 2
   @friend.save
   respond_to do |format|
     if @friend.save
       format.html{ redirect_to :back, :notice => "amigo agregado correctamente esperando que te acepte"}
       format.json { render json: @friend, status: :created, location: @friend }       
       format.js
    else
       format.html{ redirect_to :back, :notice => "tu amigo no ha sido agregado"}
       format.json { render json: @friend.errors, status: :unprocessable_entity }
       format.js
   end
 end
   
 end
 
 def sufriend
   @friend  = UserFriends.find(params[:id])
   @user = User.find(@friend.friend_one)
 end
 
 def validate_friend
   #cuando al usuario  le solicitaron ser amigos
   @second_friend_id = current_friend.id 
   @friend_a = UserFriends.find_by_friend_two(@second_friend_id)
   #cuando el usuario solicita ser amigo de alguien
   @first_friend_if = current_user.id
   @friend_b = UserFriends.find_by_friend_one(@first_friend_if)   
   #cuando el suaurio y el usuario ya solicito ser amigo
    @realtionship_users = UserFriends.find_by_friend_one_and_friend_two( @first_friend_if , @second_friend_id )
    
    @pending_relarionships_user_two = UserFriends.find_by_friend_two_and_status_friendship( current_user.id, 1)
    @pending_relarionships_user_one = UserFriends.find_by_friend_one_and_status_friendship( @user.id, 1)
    
   
 end
 
 def index
  @user = User.all
 end
 
  
end
