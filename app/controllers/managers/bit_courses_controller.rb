class Managers::BitCoursesController < Managers::BaseController
  rescue_from Timeout::Error, with: :error_connection
  rescue_from Errors::ErrorResponseAppBit, with: :error_connection
  rescue_from ActiveRecord::RecordInvalid, with: :error_save

  def index
    @bit_courses = bit_courses
  end

  def show
    @course = bit_course
    @students = bit_students
    @teachers = bit_teachers
  end

  def import
    group = bit_course
    @course = new_course(group)
    students = cursame_students(bit_students)
    teachers = cursame_teachers(bit_teachers)
    @course.members_in_courses =
      @course.add_teachers(teachers) + @course.add_students(students)
    @course.evaluation_periods = evaluation_periods(params[:folio], @course.id)
    @course.save!
    link_course_to_group(@course.id, params[:folio])
    inf_flash = { success: t('.managers.bit.success_importing_group') }
    redirect_to index_managers_bit_courses_path, flash: inf_flash
  end

  private

  def error_connection
    info_flash = { error: t('.managers.bit.error_connection') }
    redirect_to :back, flash: info_flash
  end

  def error_save(exception)
    case exception.record.class.name
    when 'User' then error_save_user(exception)
    when 'Course' then error_save_course(exception)
    else
      flash = t('.managers.bit.error_course')
      redirect_to :back, flash: { error: flash }
    end
  end

  def error_save_user(exception)
    info = "#{exception.class}: #{exception.message}: #{exception.record.email}"
    Rails.logger.error "\e[1;31m[ERROR]\e[0m " + info
    flash = t('.managers.bit.error_user') + "#{exception.record.name}"
    redirect_to :back, flash: { error: flash }
  end

  def error_save_course(exception)
    info = "#{exception.class}: #{exception.message}"
    Rails.logger.error "\e[1;31m[ERROR]\e[0m Exception " + info
    flash = t('.managers.bit.error_course') + "#{exception.record.title}"
    redirect_to :back, flash: { error: flash }
  end

  def raise_error_response(uri, response, message)
    log = "{uri: #{uri}, message: #{response.message}, code: #{response.code}}"
    Rails.logger.error "\e[1;31m[ERROR]\e[0m " + message + log
    fail Errors::ErrorResponseAppBit
  end

  def raise_error_link_course(uri, response, id)
    course = Course.find_by_id id
    course.destroy
    message = 'Error linking cursame course with bit group: '
    log = "{uri: #{uri}, message: #{response.message}, code: #{response.code}}"
    Rails.logger.error "\e[1;31m[ERROR]\e[0m" + message + log
    fail Errors::ErrorResponseAppBit
  end

  def raise_error_link_user(uri, response, id)
    user = user.find_by_id id
    user.destroy
    message = 'Error linking cursame user with bit user: '
    log = "{uri: #{uri}, message: #{response.message}, code: #{response.code}}"
    Rails.logger.error "\e[1;31m[ERROR]\e[0m" + message + log
    fail Errors::ErrorResponseAppBit
  end

  def build_uri_groups
    URI::HTTP.build(
      host: Settings.bit.host,
      port: Settings.bit.port,
      path: Settings.bit.path.groups
    )
  end

  def build_uri_group_teachers
    URI::HTTP.build(
      host: Settings.bit.host,
      port: Settings.bit.port,
      path: Settings.bit.path.group_teachers
    )
  end

  def build_uri_group_students
    URI::HTTP.build(
      host: Settings.bit.host,
      port: Settings.bit.port,
      path: Settings.bit.path.group_students
    )
  end

  def build_uri_group_evaluations
    URI::HTTP.build(
      host: Settings.bit.host,
      port: Settings.bit.port,
      path: Settings.bit.path.group_evaluations
    )
  end

  def authorization
    authorization_keyword = current_network.bit_setting.authorization_keyword
    api_key = current_network.bit_setting.api_key
    authorization_keyword + ' ' + api_key
  end

  def bit_courses
    uri = build_uri_groups
    response = HTTParty.get(
      uri,
      headers: { 'Authorization' => authorization },
      timeout: 180)
    mess = 'Error getting groups from bit: '
    response.code == 200 ? response : raise_error_response(uri, response, mess)
  end

  def bit_students
    uri = build_uri_group_students
    uri.path = uri.path + '/' + params[:folio]
    response = HTTParty.get(
      uri,
      headers: { 'Authorization' => authorization },
      timeout: 180)
    mess = 'Error getting group students from bit: '
    response.code == 200 ? response : raise_error_response(uri, response, mess)
  end

  def bit_teachers
    uri = build_uri_group_teachers
    uri.path = uri.path + '/' + params[:folio]
    response = HTTParty.get(
      uri,
      headers: { 'Authorization' => authorization },
      timeout: 180)
    mess = 'Error getting group teachers from bit: '
    response.code == 200 ? response : raise_error_response(uri, response, mess)
  end

  def bit_evaluation_periods(folio)
    uri = build_uri_group_evaluations
    uri.path = uri.path + '/' + folio
    response = HTTParty.get(
      uri,
      headers: { 'Authorization' => authorization },
      timeout: 180)
    mess = 'Error getting evaluation_periods group from bit: '
    response.code == 200 ? response : raise_error_response(uri, response, mess)
  end

  def link_course_to_group(id, folio)
    uri = build_uri_groups
    response = HTTParty.post(
      uri,
      headers: { 'Authorization' => authorization },
      body: { 'grupos' => [{ 'grupo' => folio, 'idExterno' => id }] },
      timeout: 180)
    response.code == 200 ? response : raise_error_link_course(uri, response, id)
  end

  def new_course(group)
    Course.new(
      title: group['asignatura'],
      silabus: group['nombreCompletoGrupo'],
      init_date: group['fechaInicialCiclo'].to_datetime,
      public_status: 'Private',
      network_id: current_network.id
    )
  end

  def new_user_student(bit_user)
    last_name = bit_user['apellidoPaterno'] + ' ' + bit_user['apellidoMaterno']
    User.new(
      email: bit_user['correo'],
      password: Devise.friendly_token,
      first_name: bit_user['nombre'],
      last_name: last_name,
      personal_url: SecureRandom.uuid,
      subdomain: current_network.subdomain,
      domain: request.domain
    )
  end

  def new_user_teacher(bit_user)
    last_name = bit_user['apellidoPaterno'] + ' ' + bit_user['apellidoMaterno']
    User.new(
      email: bit_user['sCorreo'],
      password: Devise.friendly_token,
      first_name: bit_user['nombre'],
      last_name: last_name,
      personal_url: SecureRandom.uuid,
      subdomain: current_network.subdomain,
      domain: request.domain
    )
  end

  def new_permissioning_teacher(id)
    Permissioning.new(
      user_id:  id,
      role_id: '3',
      network_id: current_network.id
    )
  end

  def new_permissioning_student(id)
    Permissioning.new(
      user_id:  id,
      role_id: '2',
      network_id: current_network.id
    )
  end

  def new_evaluation_period(bit_period, id)
    EvaluationPeriod.new(
      course_id: id,
      name: bit_period['nombre'],
      order: bit_period['orden'],
      short_name: bit_period['abreviatura']
    )
  end

  def create_student(bit_user)
    user = new_user_student(bit_user)
    user.permissionings = [new_permissioning_student(user.id)]
    user.save!
    link_student(user.id, bit_user['idAlumno'])
    user
  end

  def create_teacher(bit_user)
    user = new_user_teacher(bit_user)
    user.permissionings = [new_permissioning_teacher(user.id)]
    user.save!
    link_teacher(user.id, bit_user['idProfesor'])
    user
  end

  def link_student(id, bit_id)
    uri = build_uri_group_students
    response = HTTParty.post(
      uri,
      headers: { 'Authorization' => authorization },
      body: { 'alumnos' => [{ 'idAlumno' => bit_id, 'idExterno' => id }] },
      timeout: 180)
    raise_error_link_user(uri, response, id) unless response.code == 200
  end

  def link_teacher(id, bit_id)
    uri = build_uri_group_teachers
    response = HTTParty.post(
      uri,
      headers: { 'Authorization' => authorization },
      body: { 'profesores' => [{ 'idProfesor' => bit_id, 'idExterno' => id }] },
      timeout: 180)
    raise_error_link_user(uri, response, id) unless response.code == 200
  end

  def bit_course
    bit_courses.select { |course| course['folio'] == params[:folio] }.first
  end

  def cursame_students(bit_students)
    bit_students.map do |bit_student|
      user = User.find_by_email bit_student['correo']
      user.nil? ? create_student(bit_student) : user
    end
  end

  def cursame_teachers(bit_teachers)
    bit_teachers.map do |bit_teacher|
      user = User.find_by_email bit_teacher['sCorreo']
      user.nil? ? create_teacher(bit_teacher) : user
    end
  end

  def evaluation_periods(folio, id)
    periods = bit_evaluation_periods(folio)
    periods.map { |period| new_evaluation_period(period, id) }
  end
end
