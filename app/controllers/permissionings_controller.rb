class PermissioningsController < ApplicationController
  def show
    @permissioning = Permissioning.find(params[:id])
  end
  
  def update
     @user = User.find(params[:user_id])
     @role = Role.find(params[:role_id])
     @permmissioning = Permissioning.find_by_user_id_and_network_id(@user.id, current_network.id)
     @permmissioning.role_id = @role.id
     respond_to do |format|
     if @permmissioning.save
        format.json
        format.js
     else
       format.json
       format.js       
     end
   end
  end
  
  def unactive_user
   @i = params[:id]
   @p = Permissioning.find_by_id(@i)
   
    if  @p.suspended == true
      @p.suspended = false
    else
      @p.suspended = true
    end
    @p.save
    respond_to do |format|
     format.js
    end
  end
  
  
  def delete_user
     
  end
end
