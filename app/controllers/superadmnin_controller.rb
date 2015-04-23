# coding: utf-8
class SuperadmninController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:instructions, :masive_mailer]
  #skip_before_filter :authenticate_user!, :only => [:create_super_admin]
  #skip_before_filter :require_no_authentication, :only => [:create_super_admin]

  #filter_access_to :all

  layout 'super_admin'
  def statistics
    @activities = Activity.find(:all, :order => "created_at")
    @events = Event.all
    @deliverys = Delivery.all
    @assignments = Assignment.all
    @survey = Survey.all
    @user_survey_response = UserSurveyResponse.all

   @agroup_activities_by_date = Activity.order("DATE(created_at)").group("DATE(created_at)").count
   @agroup_deliveries_by_date = Delivery.order("DATE(created_at)").group("DATE(created_at)").count
   @agroup_assignments_by_date = Assignment.order("DATE(created_at)").group("DATE(created_at)").count
   @agroup_survey_by_date = Survey.order("DATE(created_at)").group("DATE(created_at)").count
   @agroup_user_survey_response_by_date = UserSurveyResponse.order("DATE(created_at)").group("DATE(created_at)").count
   @agroup_event_by_date = Event.order("DATE(created_at)").group("DATE(created_at)").count





  end

  def networks
  end

  def users
    @users = User.search(params[:search])
    @user_count = @users.count
  end

  def activities
    @activities = Activity.search(params[:search])
    @ac = @activities.count

    @ac_delivery = Activity.where(:activitye_type => 'Delivery').count
    @ac_survey =  Activity.where(:activitye_type => 'Survey').count
    @ac_assignment = Activity.where(:activitye_type => 'Assignment').count
    @ac_comment =  Activity.where(:activitye_type => 'Comment').count
    @ac_courses =  Activity.where(:activitye_type => 'Course').count
    @ac_user_survey =  Activity.where(:activitye_type => 'User_survey').count

    ### promedio de calificación por usuario

        #### promedios de calificación por tarea
        @acomplishment_sum = Assignment.sum(:accomplishment)
        @prompt_calification_by_delivery = ( @acomplishment_sum.to_f / @ac_delivery.to_f ).to_f

        #### promedio de calificación por examen

        @result_sum = UserSurvey.sum(:result)
        @prompt_calification_by_survey = ( @result_sum.to_f / @ac_survey.to_f ).to_f

        ### promedio por alumnos

        @sum_promts =  @prompt_calification_by_delivery +   @prompt_calification_by_survey
        @users= User.all
        @users_count = @users.count
        @user_promt = (@sum_promts.to_f/ @users_count.to_f).to_f

  end

  def roles
  end

  def create_super_admin
  end

  def courses_sintetic_view_and_edit
    @courses = Course.all
  end

  def publicity_modul_controller
  end

  def instructions
  end

  def masive_mailer
    @msa = MasiveMailerForSuperAdmin.find_by_key_m(params[:key])
    if @msa == nil

       n = (params[:number]).to_i
       array_sended = []
       @msa_create = MasiveMailerForSuperAdmin.create(key_m: "#{params[:key]}", title: "#{params[:titulo]}" , message: "#{params[:message]}", number_of_users: "#{params[:number]}", array_hash_from_sended: "#{array_sended}") 

       @user_to_send = User.first(n)
        
       @user_to_send.each do |uts|
         array_sended.push(uts.id)

       end
        
       
        @msa_create.delay.delayed_send_mailer(@user_to_send)


    else
         
          array_sended = []
          str = @msa.array_hash_from_sended
          eval(str)
          str = @msa.array_hash_from_sended.scan( /\d+/ ) 
          #### usuarios antiguos
          new_array_old_things = str.map!{ |s| s.to_i }
          #### usuarios actuales
          user_actualy =  User.all.map { |x| x.id}
      
         ###### resta de usuarios
        defini = user_actualy - new_array_old_things
        
        ####### busqueda de usuarios
        select_new_array = User.where(:id => defini)
        ###### seleccionar primeros usuarios -n
        first_count_selected =  select_new_array.first(@msa.number_of_users)
         
        ######  detectar como enviados  
        first_count_selected.each do |sna|
          array_sended.push(sna.id)
        end
        ###### se envian los usuarios a proceso de backend
        @msa.delay.delayed_send_mailer(first_count_selected)

        
        ######## se suman los usuarios nuevos y los antiguos
        sended_users = array_sended + new_array_old_things

        @msa.number_of_users = "#{sended_users}"
        @msa.save

       
    end
    ###### finaliza y redirecciona
    flash[:notice] = "Enviado exitos"
    redirect_to :back
  end

end
