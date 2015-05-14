class Managers::BitCoursesController < Managers::BaseController
  rescue_from Timeout::Error, with: :error_connection
  rescue_from Errors::ErrorResponseAppBit, with: :error_connection
  rescue_from ActiveRecord::RecordInvalid, with: :error_create

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
    @course.save!
    link_course_to_group(@course.id, params[:folio])
    inf_flash = { success: t('.managers.bit_messages.success_importing_group') }
    redirect_to index_managers_bit_courses_path, flash: inf_flash
  end

  private

  def error_connection
    info_flash = { error: t('.managers.bit_messages.error_connection') }
    redirect_to :back, flash: info_flash
  end

  def error_create
    info_flash = { error: 'Error, no se pudo crear el objeto' }
    redirect_to :back, flash: info_flash
  end

  def raise_error_response(uri, response, message)
    code = response.code
    mes = response.message
    info = "{ uri: #{uri}, message: #{mes}, code: #{code}"
    puts "\e[1;31m[ERROR]\e[0m" + message + info
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

  def link_course_to_group(id, folio)
    uri = build_uri_groups
    response = HTTParty.post(
      uri,
      headers: { 'Authorization' => authorization },
      body: { 'grupos' => [{ 'grupo' => folio, 'idExterno' => id }] },
      timeout: 180)
    mess = 'Error linking cursame course with bit group: '
    response.code == 200 ? response : raise_error_response(uri, response, mess)
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
      password: 'cursame_bit',
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
      password: 'cursame_bit',
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
    mess = 'Error linking cursame user with bit user student: '
    raise_error_response(uri, response, mess) unless response.code == 200
  end

  def link_teacher(id, bit_id)
    uri = build_uri_group_teachers
    response = HTTParty.post(
      uri,
      headers: { 'Authorization' => authorization },
      body: { 'profesores' => [{ 'idProfesor' => bit_id, 'idExterno' => id }] },
      timeout: 180)
    mess = 'Error linking cursame user with bit user teacher: '
    raise_error_response(uri, response, mess) unless response.code == 200
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
end
