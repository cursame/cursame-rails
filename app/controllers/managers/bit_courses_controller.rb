class Managers::BitCoursesController < Managers::BaseController
  rescue_from Timeout::Error, with: :error_connection
  rescue_from Errors::ErrorResponseAppBit, with: :error_connection
  rescue_from ActiveRecord::RecordInvalid, with: :error_creating_course

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
    @course = create_course(group)
    students = cursame_students(bit_students)
    teachers = cursame_teachers(bit_teachers)
    @course.members_in_courses =
      @course.add_teachers(teachers) + @course.add_students(students)
    link_course_to_group(@course.id, params[:folio]) if @course.save!
    inf_flash = { success: t('.managers.bit_messages.success_importing_group') }
    redirect_to index_managers_bit_courses_path, flash: inf_flash
  end

  private

  def error_connection
    info_flash = { error: t('.managers.bit_messages.error_connection') }
    redirect_to :back, flash: info_flash
  end

  def error_creating_course
    info_flash = { error: t('.managers.bit_messages.error_creating_course') }
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
    uri = build_uri_group_students + params[:folio]
    response = HTTParty.get(
      uri,
      headers: { 'Authorization' => authorization },
      timeout: 180)
    mess = 'Error getting group students from bit: '
    response.code == 200 ? response : raise_error_response(uri, response, mess)
  end

  def bit_teachers
    uri = build_uri_group_teachers + params[:folio]
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

  def create_course(group)
    Course.new(
      title: group['asignatura'],
      silabus: group['nombreCompletoGrupo'],
      init_date: group['fechaInicialCiclo'].to_datetime,
      public_status: 'Private',
      network_id: current_network.id
    )
  end

  def bit_course
    bit_courses.select { |course| course['folio'] == params[:folio] }.first
  end

  def cursame_students(bit_students)
    bit_students.map { |bit_student| User.find_by_email bit_student['correo'] }
  end

  def cursame_teachers(bit_teachers)
    bit_teachers.map { |bit_student| User.find_by_email bit_student['SCorreo'] }
  end
end
