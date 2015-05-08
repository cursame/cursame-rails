class Managers::BitCoursesController < Managers::BaseController
  def index
    @bit_courses = bit_courses
    redirect_to managers_courses_path, flash: { error: t('.managers.bit_messages.error_getting_groups') } if @bit_courses.nil?
  end

  def show
    folio = params[:folio]
    @course = bit_course(folio)
    @students = bit_students(folio)
    @teachers = bit_teachers(folio)
    redirect_to index_managers_bit_courses_path, flash: { error: t('.managers.bit_messages.error_getting_group') } if @course.nil? || @students.nil? || @teachers.nil?
  end
  
  def import
    folio = params[:folio]
    group_students = bit_students(folio)
    group_teachers = bit_teachers(folio)
    group = bit_course(folio)

    unless group_teachers.nil? || group_students.nil? || group.nil?
      @course_cursame = Course.new(title: group['asignatura'], silabus: group['nombreCompletoGrupo'], init_date: group['fechaInicialCiclo'].to_datetime, public_status: 'Private', network_id: current_network.id)
      cursame_students = cursame_students(group_students)
      cursame_teachers = cursame_teachers(group_teachers)
      @course_cursame.members_in_courses = @course_cursame.add_teachers(cursame_teachers) + @course_cursame.add_students(cursame_students)
      if @course_cursame.save
        success_link = link_course_to_group(@course_cursame.id, folio)
        if success_link
          the_flash = { success: t('.managers.bit_messages.success_importing_group') }
        else
          the_flash = { error: t('.managers.bit_messages.error_linking_course') }
          @course_cursame.destroy
        end
      else
        the_flash = { error: t('.managers.bit_messages.error_creating_course') }
      end
    else
      the_flash = { error: t('.managers.bit_messages.error_importing_group') }
    end
    redirect_to managers_courses_path, flash: the_flash
  end

  private

  def build_uri_groups
    URI::HTTP.build({
      host: Settings.bit.host,
      port: Settings.bit.port,
      path: Settings.bit.path.groups
    })
  end

  def build_uri_group_teachers
    URI::HTTP.build({
      host: Settings.bit.host,
      port: Settings.bit.port,
      path: Settings.bit.path.group_teachers
    })
  end

  def build_uri_group_students
    URI::HTTP.build({
      host: Settings.bit.host,
      port: Settings.bit.port,
      path: Settings.bit.path.group_students
    })
  end

  def authorization
    current_network.bit_setting.authorization_keyword + ' ' + current_network.bit_setting.api_key
  end

  def bit_courses
    uri = build_uri_groups
    begin
      response = HTTParty.get(uri, headers: { 'Authorization' => authorization }, timeout: 180)
      courses = response.code == 200 ? response : nil
    rescue
      puts "\e[1;31m[ERROR]\e[0m error getting groups of bit: { network_id: #{current_network.id}, network_name: #{current_network.name} }"
    end
  end

  def bit_students(folio)
    uri = build_uri_group_students + folio
    begin
      response = HTTParty.get(uri, headers: { 'Authorization' => authorization }, timeout: 180)
      students = response.code == 200 ? response : nil
    rescue
      puts "\e[1;31m[ERROR]\e[0m error getting students of bit: { network_id: #{current_network.id}, network_name: #{current_network.name} }"
    end
  end

  def bit_teachers(folio)
    uri = build_uri_group_teachers + folio
    begin
      response = HTTParty.get(uri, headers: { 'Authorization' => authorization }, timeout: 180)
      teachers = response.code == 200 ? response : nil
    rescue
      puts "\e[1;31m[ERROR]\e[0m error getting teachers of bit: { network_id: #{current_network.id}, network_name: #{current_network.name} }"
    end
  end

  def link_course_to_group(id, folio)
    uri = build_uri_groups
    begin
      response = HTTParty.post(uri, headers: { 'Authorization' => authorization }, body: { 'grupos' => [{ 'grupo' => folio, 'idExterno' => id }] }, timeout: 180)
      success = response.code == 200
    rescue
      puts "\e[1;31m[ERROR]\e[0m error linking cursame course to group of bit: { network_id: #{current_network.id}, network_name: #{current_network.name}, course_id: #{id}, group_folio: #{folio} }"
      false
    end
  end

  def bit_course(folio)
    if bit_courses.nil?
      bit_courses
    else
      bit_courses.select { |course| course['folio'] == params[:folio] }.first
    end
  end

  def cursame_students(bit_students)
    bit_students.map { |bit_student| User.find_by_email bit_student['correo'] }
  end

  def cursame_teachers(bit_teachers)
    bit_teachers.map { |bit_student| User.find_by_email bit_student['SCorreo'] }
  end
end