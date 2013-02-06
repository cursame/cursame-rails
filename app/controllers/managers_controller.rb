class ManagersController < ApplicationController
  def wall
  @member = current_network.users
  
    #### for courses counters
  @courses = current_network.courses  
  @public_courses = @courses.where(:public_status => 'public')
  @publico = @public_courses.count
  @private_courses = @courses.where(:public_status => 'Private')
  @privado =  @private_courses.count
  
    #### deliveries for courses
    
  @deliveries = current_network.deliveries
  @total_deliveries =  @deliveries.count
  @open_deliveries =  @deliveries.where(:state => 'publish')
  @close_deliveries =  @deliveries.where(:state => 'unpublish')
  @published_deliveries_count =  @open_deliveries.count
  @unpublished_deliveries_count =  @close_deliveries.count
  
  
  end

  def members
  end

  def network_configuration
  end
end
