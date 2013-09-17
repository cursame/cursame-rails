class ParentsController < ApplicationController
  skip_before_filter :authenticate_user!
  def info_to_parents
    
    ###### se atrapa la info del usuario #####
    @users = User.all
    user_info = []
    ###### se llaman las actividades y se desglosan ######
    call_activitie = []
    open_tag = []
    network = []
    ###### busca dentro del assignmente la tarea a la que pertenece ######
    delivery_pertenence = []
    ###### se genera informacion de los usuarios #######
    
    @users.each do |user|
      user_info.push({ 
      nombre_usuario: user.name,
      email: user.email,
      actividades: call_activitie
      })
        user.activities.each do |actividad|
        call_activitie.push({ id: actividad.id, titulo: actividad.title, activitye_type: actividad.activitye_type, activitye_id: actividad.activitye_id, open_activitie: open_tag })
       
        case 
          when actividad.activitye_type == 'Delivery'
              if !Delivery.exists?(:id => actividad.activitye_id)
                 next
              end
              @delivery = Delivery.find(actividad.activitye_id)
              @network= Network.find(@delivery.network_id)
              @owner = User.find(@delivery.user_id)
              
            open_tag.push({ 
            title: @delivery.title,
            description:  @delivery.description,
            publish_date:   @delivery.publish_date,
            end_date:  @delivery.end_date,
            porcent_of_evaluation:  @delivery.porcent_of_evaluation,
            state: @delivery.state,
            profesor: @owner.name,
            network: network
          
             
           })
           
           network.push({
                       id: @network.id,
                       name: @network.name,
               
                       subdomain: @network.subdomain
           })
           
        when actividad.activitye_type == 'Survey'
           if !Survey.exists?(:id => actividad.activitye_id)
               next
           end
             @survey = Survey.find(actividad.activitye_id)
             @network= Network.find(@survey.network_id)
             @owner = User.find(@survey.user_id)
           
            open_tag.push({ 
             title: @survey.name,
             description:  @survey.description,
             publish_date:   @survey.publish_date,
             end_date:  @survey.end_date,
            # porcent_of_evaluation:  @survey.porcent_of_evaluation,
             state: @survey.state,
             profesor: @owner.name,
             network: network


            })

            network.push({
                        id: @network.id,
                        name: @network.name,
                        subdomain: @network.subdomain
            })
      when actividad.activitye_type == 'Assignment'
         if !Assignment.exists?(:id => actividad.activitye_id)  
            next
         end
         @assignment = Assignment.find(actividad.activitye_id)
         @owner = User.find(@assignment.user_id)
         @delivery = Delivery.find(@assignment.delivery_id)
         @network= Network.find(@delivery.network_id)
         
           open_tag.push({ 
              title: @assignment.title,
              description: @assignment.brief_description,
              delivery_pertenence: delivery_pentenece
              
           })
         
           delivery_pentenece.push({
               title: @delivery.title,
               description:  @delivery.description,
               publish_date:   @delivery.publish_date,
               end_date:  @delivery.end_date,
               porcent_of_evaluation:  @delivery.porcent_of_evaluation,
               state: @delivery.state,
               profesor: @owner.name,
               network: network
           })
           
          network.push({
              id: @network.id,
              name: @network.name,
              subdomain: @network.subdomain
              })
           
           
           
           
           
     end
     end
        
        
    end
    
    render :json => {message:"Acceso a usuarios", network: user_info}, :callback => params[:callback]
    
    
  end
  
end
