class ManagersController < ApplicationController
  def wall
  ##### for users bar
  @member = current_network.permissionings
  @member_count = @member.count
  @network_population = current_network.population
  @diision =  @member.count 
  @porcent_of_students =   (@diision* 100)/ @network_population
 # @network_users = User.where(:network => current_network)
  
  
  
  
    #### for courses counters
  @courses = current_network.courses  
  @public_courses = @courses.where(:public_status => 'public')
  @publico = @public_courses.count
  @private_courses = @courses.where(:public_status => 'Private')
  @privado =  @private_courses.count
  
    #### deliveries for courses
    
  @deliveries = current_network.deliveries
  @total_deliveries =  @deliveries.count
  @open_deliveries =  @deliveries.where(:state => 'published')
  @close_deliveries =  @deliveries.where(:state => 'unpublish')
  @published_deliveries_count =  @open_deliveries.count
  @unpublished_deliveries_count =  @close_deliveries.count
  
  
  end

  def members
  end

  def network_configuration
    @network= current_network
  end
  
  def permissioning
  end
  
  def permissioning_update
    @permissioning = Permissioning.find(params[:id])
   if @permissioning.save
      redirect_to :back
   else
   end
    
  end
end
