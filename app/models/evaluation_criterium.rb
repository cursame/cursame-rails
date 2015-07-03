class EvaluationCriterium < ActiveRecord::Base
  belongs_to :evaluable, polymorphic: true
  has_many :members_in_course_criteria, dependent: :destroy
  validates :name, presence: true

  after_create do
    self.evaluable.members_in_courses.each { |member| member.destroy_grades } if self.evaluable_type == 'Course'
  end

  after_destroy do
    self.evaluable.members_in_courses.each { |member| member.destroy_grades } if self.evaluable_type == 'Course'
  end

  after_update do
    self.evaluable.members_in_courses.each { |member| member.destroy_grades } if self.evaluable_type == 'Course'
    link_to_bit if evaluable_type == 'EvaluationPeriod'
  end

  private

  def set_name
    case self.name
      when 'cursame_deliveries' then 'Tareas'
      when 'cursame_surveys' then 'Cuestionarios'
      when 'cursame_discussions' then 'Discusiones'
      else self.name
    end
  end

  def build_uri_evaluation
    URI::HTTP.build(
      host: Settings.bit.host,
      port: Settings.bit.port,
      path: Settings.bit.path.evaluation
    )
  end

  def authorization
    network = evaluable.course.network
    authorization_keyword = network.bit_setting.authorization_keyword
    api_key = network.bit_setting.api_key
    authorization_keyword + ' ' + api_key
  end

  def raise_error_link_evaluation(uri, response)
    message = 'Error linking evaluation cursame with bit.'
    log = "{uri: #{uri}, message: #{response.response.body}, code: #{response.code}}"
    Rails.logger.error "\e[1;31m[ERROR]\e[0m" + message + log
    fail Errors::ErrorResponseAppBit
  end

  def link_to_bit
    puts authorization
    uri = build_uri_evaluation
    response = HTTParty.post(
      uri,
      headers: { 'Authorization' => authorization },
      body: { 'escalas' => [{ 'idGrupoExterno' => evaluable.course.id,
                              'idEvaluacionExterno' => evaluable.id,
                              'noPeriodoEvaluacion' => evaluable.order,
                              'idRubroExterno' => id, 'rubro' => set_name,
                              'valorEscala' => evaluation_percentage,
                              'califMimina' => 0,
                              'califMaxima' => 10 }] },
      timeout: 180)
    raise_error_link_evaluation(uri, response) unless response.code == 200
  end
end
