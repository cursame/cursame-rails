class MembersInCourse < ActiveRecord::Base
  belongs_to :course
  belongs_to :user

  def evaluation
    surveys = Survey.where(:course_id => self.course_id)
    evaluationSurveys = 0.0
    surveys.each do |response|
      user_survey = UserSurvey.find_by_survey_id_and_user_id(response.id,self.user_id)
      if user_survey.result.nil? then
        user_survey.evaluation
        user_survey = UserSurvey.find_by_survey_id_and_user_id(response.id,self.user_id)
      end
      evaluationSurveys += user_survey.result
    end
    evaluationSurveys = evaluationSurveys/surveys.size 
    
    assignments = Assignment.where(:course_id => self.course_id, :user_id => self.user_id) 
    evaluationDeliverys = 0.0
    
    assignments.each do |response|
      evaluationDeliverys += response.accomplishment.to_f
    end

    course = Course.where(:id => self.course_id).first_or_create
    
    survey_param_evaluation = (course.survey_param_evaluation.to_f)/100.0
    
    delivery_param_evaluation = (course.delivery_param_evaluation.to_f)/100.0
    
    evaluation = evaluationSurveys * survey_param_evaluation + 
      evaluationDeliverys * delivery_param_evaluation
    
    return evaluation
  end
end
