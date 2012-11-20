class NetworksUsersController < ApplicationController
  def crete_data
    @NetworksUsers = NetworksUsers.new(params[:networks_users])
         
      respond_to do |format|
    if @NetworksUsers.save
       format.hmtl{ redirect_to current_network, :notice => "te has suscrito correctamente"}
        format.json { render json: @NetworksUsers }
       formar.js
    else
       format.hmtl{ redirect_to current_network, :notice => "te has suscrito incorrectamente"}
        format.json { render json: @NetworksUsers }
       format.js
    end
     end
  end

  def new
    @NetworksUsers = NetworksUsers.new  
  end
end
