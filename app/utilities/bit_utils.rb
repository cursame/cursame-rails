module BitUtils
  def authorization
    authorization_keyword = current_network.bit_setting.authorization_keyword
    api_key = current_network.bit_setting.api_key
    authorization_keyword + ' ' + api_key
  end

  def build_uri_activity
    URI::HTTP.build(
      host: Settings.bit.host,
      port: Settings.bit.port,
      path: Settings.bit.path.activity
    )
  end

  def raise_error_link_delivery(uri, response, id)
    delivery = Delivery.find_by_id id
    delivery.destroy
    message = 'Error linking cursame delivery with bit: '
    log = "{uri: #{uri}, message: #{response.message}, code: #{response.code}}"
    Rails.logger.error "\e[1;31m[ERROR]\e[0m" + message + log
    fail Errors::ErrorResponseAppBit
  end

  def raise_error_link_survey(uri, response, id)
    survey = Survey.find_by_id id
    survey.destroy
    message = 'Error linking cursame survey with bit: '
    log = "{uri: #{uri}, message: #{response.message}, code: #{response.code}}"
    Rails.logger.error "\e[1;31m[ERROR]\e[0m" + message + log
    fail Errors::ErrorResponseAppBit
  end

  def raise_error_link_discussion(uri, response, id)
    discussion = Discussion.find_by_id id
    discussion.destroy
    message = 'Error linking cursame survey with bit: '
    log = "{uri: #{uri}, message: #{response.message}, code: #{response.code}}"
    Rails.logger.error "\e[1;31m[ERROR]\e[0m" + message + log
    fail Errors::ErrorResponseAppBit
  end

  def link_delivery_to_bit(activity)
    uri = build_uri_activity
    course = activity.courses.first
    evaluation_period = activity.evaluation_period
    evaluation_criterium = evaluation_period.evaluation_criteria.where(name: 'cursame_deliveries').first
    response = HTTParty.post(
      uri,
      headers: { 'Authorization' => authorization },
      body: { 'actividades' => [{ 'idGrupoExterno' => course.id,
                                  'idEvaluacionExterno' => evaluation_period.id,
                                  'idRubroExterno' => evaluation_criterium.id,
                                  'idActividadExterna' => activity.id,
                                  'fechaInicial' => activity.publish_date.to_i,
                                  'fechaFinal' => activity.end_date.to_i,
                                  'nombre' => activity.title,
                                  'descripcion' => activity.description }] },
      timeout: 180)
     raise_error_link_delivery(uri, response, activity.id) unless response.code == 200
  end

  def link_survey_to_bit(activity)
    uri = build_uri_activity
    course = activity.courses.first
    evaluation_period = activity.evaluation_period
    evaluation_criterium = evaluation_period.evaluation_criteria.where(name: 'cursame_surveys').first
    response = HTTParty.post(
      uri,
      headers: { 'Authorization' => authorization },
      body: { 'actividades' => [{ 'idGrupoExterno' => course.id,
                                  'idEvaluacionExterno' => evaluation_period.id,
                                  'idRubroExterno' => evaluation_criterium.id,
                                  'idActividadExterna' => activity.id,
                                  'fechaInicial' => activity.publish_date.to_i,
                                  'fechaFinal' => activity.end_date.to_i,
                                  'nombre' => activity.title,
                                  'descripcion' => "Cuestionario" }] },
      timeout: 180)
     raise_error_link_survey(uri, response, activity.id) unless response.code == 200
  end

  def link_discussion_to_bit(activity)
    uri = build_uri_activity
    course = activity.courses.first
    evaluation_period = activity.evaluation_period
    evaluation_criterium = evaluation_period.evaluation_criteria.where(name: 'cursame_discussions').first
    response = HTTParty.post(
      uri,
      headers: { 'Authorization' => authorization },
      body: { 'actividades' => [{ 'idGrupoExterno' => course.id,
                                  'idEvaluacionExterno' => evaluation_period.id,
                                  'idRubroExterno' => evaluation_criterium.id,
                                  'idActividadExterna' => activity.id,
                                  'fechaInicial' => activity.publish_date.to_i,
                                  'fechaFinal' => activity.end_date.to_i,
                                  'nombre' => activity.title,
                                  'descripcion' => activity.description }] },
      timeout: 180)
     raise_error_link_discussion(uri, response, activity.id) unless response.code == 200
  end
end
