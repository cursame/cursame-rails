class UsersController < ApplicationController
  def show
    @user = User.find_by_personal_url(params[:personal_url])
    #helper methods in aplication controller
    pertenence!
    links     
  end

 def pertenence!
   
     @user_id = @user.id
     @user_pertenence = NetworksUsers.find_by_user_id(@user_id)
     @networks_petenence_user = @user_pertenence.network_id
     @network = Network.find_by_id(@networks_petenence_user)
     @n = @network
     
 end
 
  
end
