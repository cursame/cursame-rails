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
      user_surveys.each_with_index.inject(0.0) { 
        |result, (user_survey,index)|
        if user_survey
          result += user_survey.result ? user_survey.result : user_survey.evaluation
        else
          result += 0.0
        end
      }.to_i
    else ;0;end
  end
  
  # Calcula la calificacion de tareas
  def evaluation_deliveries(assignments, deliveries)
    if assignments.any? then
      assignments.each_with_index.inject(0.0) { 
        |result, (assignment,index)|
        porcent_of_evaluation = deliveries[index].porcent_of_evaluation.to_f/100.0
        if assignment
          if assignment.accomplishment
            result += assignment.accomplishment.to_f * porcent_of_evaluation
          else
            result += 0
        else
          result += 0
        end
      }.to_i
    else; 0;end
  end
  
  #
  # table["deliveries"] => Hash con la informacion de tareas
  #      table["deliveries"]["deliveries"] => Tareas ordenadas, es un Array
  #      table["deliveries"]["assignments"] => Tareas entregadas, es un Array
  #      table["deliveries"]["percent_of_deliveries"] => % de la evaluacion
  #      table["deliveries"]["evaluation_total"] => Calificacion de las tareas
  #
  # table["surveys"] => Hash con la informacion de los examenes
  #      table["surveys"]["surveys"] => Examenes ordenados, es un Array
  #      table["surveys"]["user_surveys"] => Respuestas a examenes, es un Array
  #      table["surveys"]["percent_of_surveys"] => % de la evaluacion
  #      table["surveys"]["evaluation_total"] => Calificacion de los examenes
  #      table["surveys"]["percent_of_evaluation"] => % Obtenido
  #
  # table["evaluation"] => Calificacion total del curso.

  # Si logras mejorar este metodo, por favor, deja tu nombre.
  def course_evaluation(course,deliveries, surveys)
    
    table = {}
    deliveries_table = {}
    surveys_table = {}
    
    deliveries_table["deliveries"] = course.deliveries.sort{ |x,y| x.created_at <=> y.created_at }
    deliveries_table["assignments"] = deliveries_table["deliveries"].map {
      |delivery|
      Assignment.find_by_delivery_id_and_user_id(delivery.id,self.user_id)
    }
    deliveries_table["percent_of_deliveries"] = course.delivery_param_evaluation.to_f 
    deliveries_table["evaluation_total"] = 
      evaluation_deliveries(deliveries_table["assignments"], deliveries_table["deliveries"])
    
    surveys_table["surveys"] = course.surveys.sort{ |x,y| x.created_at <=> y.created_at }
    surveys_table["user_surveys"] = surveys_table["surveys"].map {
      |survey|
      UserSurvey.find_by_survey_id_and_user_id(survey.id,self.user_id)
    }
    surveys_table["percent_of_surveys"] = course.survey_param_evaluation.to_f
    surveys_table["evaluation_total"] = 
      evaluation_surveys(surveys_table["user_surveys"],surveys_table["surveys"])
    surveys_table["percent_of_evaluation"] =
      surveys_table["evaluation_total"] * surveys_table["percent_of_surveys"]/100.0

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
