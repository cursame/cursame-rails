class NetworksUsersController < ApplicationController
  def create_data
    @NetworksUsers = NetworksUsers.new(params[:networks_users])
         
      respond_to do |format|
    if @NetworksUsers.save
       format.html{ redirect_to current_network, :notice => "te has suscrito correctamente"}
       format.json { render json: @NetworksUsers, status: :created, location: @NetworksUsers }       
       format.js
    else
       format.html{ redirect_to current_network, :notice => "te has suscrito incorrectamente"}
       format.json { render json: @NetworksUsers.errors, status: :unprocessable_entity }
       format.js
    end
     end
  end

  def new
    @NetworksUsers = NetworksUsers.new  
  end
end
