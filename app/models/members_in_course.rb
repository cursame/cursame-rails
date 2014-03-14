class MembersInCourse < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  
  after_create do
    if (!self.owner) then
      if(!self.accepted) then
        Notification.create(:notificator => self, :users => self.course.owners, :kind => "user_request_membership_in_course", :active => true)
      end
    end
  end
  
  after_update do
    accepted = self.changes[:accepted]
    if (!accepted.nil?) then
      if (!accepted[0] and accepted[1]) then
        mail = Notifier.accepted_message(self,self.course)
        mail.deliver
        Notification.create(:users => [self.user], :notificator => self.course, :kind => 'user_accepted_in_course')
      end
    end
  end
    
  before_destroy do
    notifications = Notification.where(:notificator_id => self.course_id,:notificator_type => "Course",:kind => 'user_accepted_in_course')
    
    notifications.each do
      |notification|
      if notification.users.include?(self.user) then
        notification.destroy
      end
    end
  end
  
  # Calcula la calificacion de examenes

  def evaluation_surveys(user_surveys, surveys)
    if user_surveys.any? then
      resultado = 0
      @count = surveys.count
      user_surveys.each_with_index.inject(0.0) { 
        |result, (user_survey,index)|
        if user_survey
          resultado = resultado+user_survey.result
        else
          resultado = resultado + 0.0
        end
      }.to_i
      result = resultado.to_f/@count.to_f
      else ;0;end
  end
  
  # Calcula la calificacion de tareas
  def evaluation_deliveries(assignments, deliveries)
    ###### ingresa al total del valor sobre el que se va a evaluar ######
    value_p_o_e = 0
    assigment_docificate = 0
    deliveries.each do |d|
     value_p_o_e = value_p_o_e.to_i + d.porcent_of_evaluation.to_i
    end

    ###### creamos un contador sobre las tareas ######
    if assignments.any? then
       assignments.each do |as|

       if as.delivery == nil

          individual_porcent = 0 

       else

          individual_porcent = as.delivery.porcent_of_evaluation 

       end

       individual_result = as.accomplishment.to_f/100
       evalution_assigment = individual_porcent.to_f * individual_result.to_f
       assigment_docificate = evalution_assigment.to_f + assigment_docificate.to_f 

       end
       result = (assigment_docificate.to_f/value_p_o_e.to_f)*100
       else
       result = 0
    end

   

  end
  

  # Si logras mejorar este metodo, por favor, deja tu nombre.


  def course_evaluation(course,deliveries, surveys)
    count_surveys = surveys.count
    table = {}
    deliveries_table = {}
    surveys_table = {}
    
    survey_value = course.survey_param_evaluation
    delivery_value = course.delivery_param_evaluation
    
    deliveries_table["deliveries"] = course.deliveries.sort{ |x,y| x.created_at <=> y.created_at }
    deliveries_table["assignments"] = deliveries_table["deliveries"].map {
      |delivery|
      Assignment.find_by_delivery_id_and_user_id(delivery.id,self.user_id)
    }
    deliveries_table["percent_of_deliveries"] = course.delivery_param_evaluation.to_f 
    deliveries_table["evaluation_total"] = (evaluation_deliveries(deliveries_table["assignments"], deliveries_table["deliveries"]).to_i * delivery_value.to_i)/100
    surveys_table["surveys"] = course.surveys.sort{ |x,y| x.created_at <=> y.created_at }
    
    surveys_table["user_surveys"] = surveys_table["surveys"].map {
      |survey|
      UserSurvey.find_by_survey_id_and_user_id(survey.id,self.user_id)
    }

    #### mi nombre es JARDA #####
    surveys_table["percent_of_surveys"] = course.survey_param_evaluation.to_f
    surveys_table["evaluation_total"] =  evaluation_surveys(surveys_table["user_surveys"],surveys_table["surveys"]) if count_surveys != 0
    surveys_table["evaluation_total"] = 0 if count_surveys == 0
    surveys_table["percent_of_evaluation"] = (surveys_table["evaluation_total"] * surveys_table["percent_of_surveys"])/100 if count_surveys != 0
    surveys_table["percent_of_evaluation"] = 0 if count_surveys == 0
    
    table["deliveries"] = deliveries_table
    table["surveys"] = surveys_table 
    table["evaluation"] = deliveries_table["evaluation_total"] + 
      surveys_table["percent_of_evaluation"]
    
    table
  end

  # obtiene si es owner del grupo mediante un delivery
  def self.is_owner_by_delivery_and_user_id(delivery,user)
    delivery.courses.each do |course|
      owner = self.find_by_course_id_and_user_id_and_owner(course.id,user.id,true)
      if owner
        return true
      end
    end
    return false
  end

  def import(path,network,course,user_admin)
    arrayErrores = Array.new
    count = 1

    CSV.foreach(path, headers: true) do |row|
      if !row["id"].nil? then
        member_in_course = MembersInCourse.find_by_id(row["id"]) || MembersInCourse.new
      else
        member_in_course = MembersInCourse.new
      end

      errors = false

      hash = row.to_hash
      email = hash.delete("Email")

      user = User.find_by_email(email)

      if !email.nil? then
        if user.nil?
          arrayErrores.push({:line => count, :message => "El correo no pertenece a algun usuario activo."})
          errors = true
        end
      else
        arrayErrores.push({:line => count, :message => "No se especifico un correo"})
        errors = true
      end

      owner = hash.delete("Propietario")

      owner.downcase! if !owner.nil?
      owner.strip! if !owner.nil?

      if owner != "0" and owner != "1" then
        arrayErrores.push({:line => count,:message => "No se especifico si es propietario o no del curso" })
        errors = true
      elsif owner == "0" then
          owner = true
      else
        owner = nil
      end

      if !errors then
        begin
          member_db = MembersInCourse.find_by_user_id_and_course_id_and_network_id(user.id,course.id,network.id)
          member_in_course = member_db if !member_db.nil?
          member_in_course.user_id = user.id
          member_in_course.course_id = course.id
          member_in_course.accepted = true
          member_in_course.owner = owner
          member_in_course.network_id = network.id
          member_in_course.active_status = true
          member_in_course.save!
        rescue ActiveRecord::RecordInvalid => invalid
          invalid.record.error.each do |error|
            arrayErrores.push({:line => count, :message => "Falta especificar: " + error.to_s })
          end
        end
      end
    end

    mail = Notifier.send_import_members(user_admin,arrayErrores,course)
    mail.deliver
  end

  handle_asynchronously :import, :priority => 20, :run_at => Proc.new{Time.zone.now}

  def title
    return ""
  end

end
