class NetworksUsersController < ApplicationController
  
  def create_data
    @NetworksUsers = NetworksUser.new(params[:networks_user])         
      respond_to do |format|
        if @NetworksUsers.save
       format.json     
       format.js
        else
       format.json
       format.js
        end
      end
  end

  def new
    @NetworksUsers = NetworksUser.new  
  end
  
  def index
   @usersid = current_network.networks_users  
  end


  
  
end
