class MembersInCourse < ActiveRecord::Base
  belongs_to :course
  belongs_to :user
  
  def deliveries
    #return Delivery.where()
  end
  
  #
  #
  #
  def evaluationSurveys
    course = Course.find(self.course_id)
    evaluationSurveys = 0.0
    course.surveys.each do |response|
      user_survey = UserSurvey.find_by_survey_id_and_user_id(response.id, self.user_id)
      if (user_survey.nil?) then
        return 0.0
      end
      if user_survey.result.nil? then
        user_survey.evaluation
        user_survey = UserSurvey.find_by_survey_id_and_user_id(response.id,self.user_id)
      end
      evaluationSurveys += user_survey.result
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
        evaluationDeliverys += response.accomplishment.to_f
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
    evaluation_total_array = Array.new
    evaluation_total_array[0] = course.delivery_param_evaluation
    evaluation_total_array[1] = self.evaluationDeliverys
    delivery_param_evaluation = course.delivery_param_evaluation.to_f/100.0
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
    return table_course
  end
  
end
