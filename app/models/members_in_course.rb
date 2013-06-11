class MembersInCourse < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  after_update do
    accepted = self.changes[:accepted]
    if (!accepted.nil?)
      if (!accepted[0] and accepted[1])
        mail = Notifier.accepted_message(self,self.course)
        mail.deliver
      end
    end
  end

  after_create do
=begin
    mail = Notifier.new_member_in_course(self,self.course)
    mail.deliver
=end
    if self.owner.nil? then
      Notification.create(:user => self.user, :notificator => self.course, :kind => 'user_accepted_in_course')
    end
  end


  #
  #
  #
  def evaluationSurveys
    course = Course.find(self.course_id)
    evaluationSurveys = 0.0
    if (course.surveys.size == 0) then
      return 0
    end
    course.surveys.each do |response|
      user_survey = UserSurvey.find_by_survey_id_and_user_id(response.id, self.user_id)
      user_survey_result = 0
      if (!user_survey.nil?) then
        if user_survey.result.nil? then
          user_survey.evaluation
          user_survey = UserSurvey.find_by_survey_id_and_user_id(response.id,self.user_id)
        end
        user_survey_result = user_survey.result
      end
      evaluationSurveys += user_survey_result
    end
    evaluationSurveys = evaluationSurveys/course.surveys.size
    return evaluationSurveys.to_i
  end

  #
  #
  #
  def evaluationDeliverys
    course = Course.find(self.course_id)
    evaluationSurveys = evaluationSurveys
    assignments = Assignment.where(:course_id => self.course_id, :user_id => self.user_id)
    evaluationDeliverys = 0.0
    if !assignments.nil? then
      assignments.each do |response|
        porcent_of_evaluation = response.delivery.porcent_of_evaluation.to_f/100.0
        evaluationDeliverys += response.accomplishment.to_f * porcent_of_evaluation
      end
    end

    return evaluationDeliverys.to_i
  end

  def evaluation

    survey_param_evaluation = (course.survey_param_evaluation.to_f)/100.0

    delivery_param_evaluation = (course.delivery_param_evaluation.to_f)/100.0

    evaluation = evaluationSurveys * survey_param_evaluation +
      evaluationDeliverys * delivery_param_evaluation

    return evaluation
  end

  #
  # table_member[0] => Tareas ordenadas de acerudo a la fecha de creacion en la base de datos
  # table_member[1] => Calificaciones de cada tarea.
  # table_member[2] => Calificacion total de las tareas.
  # table_member[2][0..2] => Valor de las tareas, calificiacion en 100%, calificacion del total.
  #
  def doTableDeliveries
    table_member = Array.new
    course = Course.find(self.course_id)
    deliveries = course.deliveries.sort{|x,y| x.created_at <=> y.created_at}
    table_member[0] = deliveries
    assignments_array = Array.new
    for i in 0...deliveries.size
      assignments_array[i] =  Assignment.find_by_delivery_id_and_user_id(deliveries[i].id,self.user_id)
    end
    table_member[1] = assignments_array
    delivery_param_evaluation = course.delivery_param_evaluation.to_f/100.0
    evaluation_total_array = Array.new
    evaluation_total_array[0] = course.delivery_param_evaluation
    evaluation_total_array[1] = self.evaluationDeliverys * delivery_param_evaluation
    table_member[2] = evaluation_total_array
    return table_member
  end


  #
  # table_member[0] => Lista de Surveys
  # table_member[1] => Lista de User_Surveys
  # table_member[2] => Calificacion total
  # table_member[2][0..2] => Valor de los examenes, calificiacion en 100%, calificacion del total.
  #
  def doTableSurveys
    table_member = Array.new
    course = Course.find(self.course_id)
    surveys = course.surveys.sort{ |x,y| x.created_at <=> y.created_at}
    table_member[0] = surveys
    user_survey_array = Array.new
    for i in 0...surveys.size
      user_survey_array[i] = UserSurvey.find_by_survey_id_and_user_id(surveys[i].id,self.user_id)
    end
    table_member[1] = user_survey_array
    evaluation_total_array = Array.new
    evaluation_total_array[0] = course.survey_param_evaluation
    evaluation_total_array[1] = self.evaluationSurveys
    survey_param_evaluation = course.survey_param_evaluation.to_f/100.0
    evaluation_total_array[2] = evaluation_total_array[1] * survey_param_evaluation
    evaluation_total_array[1] = self.evaluationSurveys/10.0
    table_member[2] = evaluation_total_array
    return table_member
  end

  #
  # Manda a llamar los dos metodos anteriores para unirlos en un arreglo
  #
  def doTableCourse
    table_course = Array.new
    table_course[0] = doTableDeliveries
    table_course[1] = doTableSurveys
    table_course[2] = evaluation
    return table_course
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

end
