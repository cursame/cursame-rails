# -*- coding: utf-8 -*-
class ParentsController < ApplicationController
  skip_before_filter :authenticate_user!
  def info_to_parents
    
    ###### se atrapa la info del usuario #####
    user = User.find_by_key_analytics(params[:key_analytics])
    if user == nil 
      user_info = ''
    else
    user_info = []
    ###### se llaman las actividades y se desglosan ######
    call_activitie = []
    open_tag = []
    network = []
    ###### busca dentro del assignmente la tarea a la que pertenece ######
    ###### se genera informacion de los usuarios #######
    
      user_info.push({ 
      nombre_usuario: user.name,
      email: user.email,
      actividades: call_activitie
      })
        user.activities.each do |actividad|
        call_activitie.push({ id: actividad.id, titulo: actividad.title, activitye_type: actividad.activitye_type, activitye_id: actividad.activitye_id, open_activitie: '' })
 
        end
    
    end
    
    render :json => {message:"Acceso a usuarios", user_info: user_info}, :callback => params[:callback]
    
    
  end
  
  def inc_activity
    @type = params[:type_act]
    @id = params[:id]
    
    puts @id
    puts @type
    
      open_tag = []
      network = []
      delivery_pertenence = []
      
     case 
        when @type == 'Delivery'
          
            @delivery = Delivery.find(@id)
         if @delivery != nil
            @network= Network.find(@delivery.network_id)
            @owner = User.find(@delivery.user_id)
       
          open_tag.push({ 
          type: @type,
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
      when @type == 'Survey'
        
           @survey = Survey.find(@id)
         if  @survey  != nil
           @network= Network.find(@survey.network_id)
           @owner = User.find(@survey.user_id)
         
          open_tag.push({ 
           type: @type,
           title: @survey.name,
           description:  @survey.name, #@survey.description,
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
         end
    when @type == 'Assignment'
       @assignment = Assignment.find(@id)
       if @assignment  != nil
       
       @owner = User.find(@assignment.user_id)
       @delivery = Delivery.find(@assignment.delivery_id)
       @network= Network.find(@delivery.network_id)
       
         open_tag.push({ 
            type: @type,
            title: @assignment.title,
            description: @assignment.brief_description,
            delivery_pertenence: delivery_pertenence,
            accomplishment: @assignment.accomplishment, 
            rub_calification: @assignment.rub_calification,
            publish_date: @assignment.created_at
         })
       
         delivery_pertenence.push({
             type: @type,
             title: @delivery.title,
             description:  @delivery.description,
             publish_date:   @delivery.publish_date,
             end_date:  @delivery.end_date,
             porcent_of_evaluation:  @delivery.porcent_of_evaluation,
             state: @delivery.state,
             profesor: @owner.name,
             email_owner: @owner.email,
             network: network
         })
         
        network.push({
            id: @network.id,
            name: @network.name,
            subdomain: @network.subdomain
            })
       end
     when @type == 'User_survey'
       
       @user_survey = UserSurvey.find(@id)
       if @user_survey != nil
       @survey_h = Survey.find(@user_survey.survey_id)
        open_tag.push({ 
           type: @type,
           title: @survey_h.title,
           description: "Entrega del exmen #{@survey_h.title}",
           accomplishment: @user_survey.evaluation, 
           publish_date: @user_survey.created_at
        })
       
       end
     
   end
    
    render :json => {message:"Acceso a una actividad", actividad: open_tag }, :callback => params[:callback]
    
  end
  
  def general_prm
     fcourse_h = []
     @user = User.find_by_key_analytics(params[:key_analytics])
     ##### comieza el acceso a surveys
     @acces_to_survey = @user.user_surveys
     ##### comienza el acceso a assignments
     @acces_to_assignment = @user.assignments

     ##### comienza el acceso a cursos
     @acces_to_courses = @user.courses.where(:active_status => true)

     #### promedio general
      @general_potential = 0
       @n = 0

       @acces_to_courses.each do |course|
            @member = course.members_in_courses.where(:user_id => @user.id)

            @member.each do |c|
                eval = c.evaluation
                 @n = @n + 1
                 @general_potential =  @general_potential+eval

           end
      end
       
       @general_potentia = @general_potential/ @n
       
       @user.courses.each do |course|
         
          
           @member = MembersInCourse.find_by_user_id_and_course_id(@user.id,  course.id)
           if @member != nil
           if course != nil
             fcourse_h.push({ 
              titulo: course.title,
              id:  course.id,
              silabus:  course.silabus
             # owner: MembersInCourse.find_by_course_id(course.id, :where => (owner = true))
              })
           end
           end
       end
       
       
       render :json => {message:"Promedio general", promedio: @general_potential, cursos: fcourse_h  }, :callback => params[:callback]
       

  end
  
  def acces_course
    @course = Course.find(params[:id])
    @user = User.find_by_key_analytics(params[:key_analytics])
    @acumulater_deliveries = 0
    @totolite_d = 0
    @cal_deliveries = 0
    @totalite_s = 0
    d_h_course = []
    s_h_course = []
    
    @course.deliveries.each do |d|
      @find_assignment = Assignment.find_by_delivery_id_and_user_id(d.id, @user.id) 
        @totolite_d =   @totolite_d + d.porcent_of_evaluation
        @valor_eval =  (d.porcent_of_evaluation.to_f / @totolite_d.to_f)*100
      puts @find_assignment
      if @find_assignment != nil
         
        @nk = "<div style='color:#098E07;'>entregada con el título #{ @find_assignment.title }</div>"
        if @valor_eval != nil
          if @find_assignment.accomplishment != nil
             @accd = @find_assignment.accomplishment 
              @converter_prompt = (@accd/100) * d.porcent_of_evaluation 
             # puts  @converter_prompt
          #   @converter_prompt = @accd / @totolite_d.to_f
              @cal_deliveries= @converter_prompt  +  @cal_deliveries
            #  puts = @cal_deliveries
               @changer =   (@cal_deliveries.to_f / @totolite_d.to_f)*100
           #  puts  @changer
             else
             @accd = 0
          end
        end
      else
        @nk = "<div style='color:#FD2318;'>sin entregar</div>"
      end
     d_h_course.push({ 
       titulo: d.title,
       entregada_por_el_usuario: @nk,
       acomplishment: @accd,
       fecha_limite: d.end_date
       
     })    
    end
    @course.surveys.each do |s|
      @user_survey = UserSurvey.find_by_survey_id_and_user_id(s.id, @user.id)
      if @user_survey != nil
         @sc = "<div style='color:#098E07;'>contestado</div>"
          
             @totalite_s =  (@totalite_s.to_f + @user_survey.evaluation.to_f)/@course.surveys.count
             
        else
         @sc = "<div style='color:#FD2318;'>sin entregar</div>"
      end
      s_h_course.push({
        titulo: s.title,
        contestado: @sc,
        fecha_limite: s.end_date
      })
    end
    
    
      @totolite_d_g = ( @cal_deliveries.to_f /  @totolite_d.to_f  ) * 100
      if @totalite_s != nil
        if @changer != nil
            @result_prom_per_course = (@totalite_s + @changer)/2
         else
            @result_prom_per_course = 0
        end
      end
     # puts @result_prom_per_course
    render :json => {message:"Promedio general", tareas: d_h_course, prom_deliveries: @cal_deliveries, act_deliveries: "#{@changer}%", examenes: s_h_course, porcentaje_de_aproc_s: "#{@totalite_s}%", course_prom: "#{@result_prom_per_course}%"}, :callback => params[:callback]
    
  end
  
  
 
  
  
  
  
end
