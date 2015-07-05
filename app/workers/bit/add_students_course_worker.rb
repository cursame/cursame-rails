class Bit::AddStudentsCourseWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 2

  def perform(id, bit_student, domain)
    @course = Course.find_by_id id
    unless @course.nil?
      user = User.find_by_email(bit_student['correo']) || create_student(bit_student, @course, domain)
      MembersInCourse.create(
        owner: false, course: @course,
        user: user,
        network_id: @course.network_id,
        accepted: true
      ) unless user.nil?
    end
  end

  private

  def build_uri_group_students
    URI::HTTP.build(
      host: Settings.bit.host,
      port: Settings.bit.port,
      path: Settings.bit.path.group_students
    )
  end

  def authorization(network)
    authorization_keyword = network.bit_setting.authorization_keyword
    api_key = network.bit_setting.api_key
    authorization_keyword + ' ' + api_key
  end

  def new_user_student(bit_user, course, domain)
    last_name = bit_user['apellidoPaterno'] + ' ' + bit_user['apellidoMaterno']
    User.new(
      email: bit_user['correo'],
      password: Devise.friendly_token,
      first_name: bit_user['nombre'],
      last_name: last_name,
      personal_url: SecureRandom.uuid,
      subdomain: course.network.subdomain,
      domain: domain
    )
  end

  def new_permissioning_student(id, course)
    Permissioning.new(
      user_id:  id,
      role_id: '2',
      network_id: course.network_id
    )
  end

  def link_student(id, bit_id)
    user = User.find_by_id id
    network = user.networks.first
    uri = build_uri_group_students
    response = HTTParty.post(
      uri,
      headers: { 'Authorization' => authorization(network) },
      body: { 'alumnos' => [{ 'idAlumno' => bit_id, 'idExterno' => id }] },
      timeout: 180)
    raise_error_link_user(uri, response, id) unless response.code == 200
    response.code == 200
  end

  def raise_error_link_user(uri, response, id)
    user = User.find_by_id id
    user.destroy
    message = 'Error linking cursame user with bit user: '
    log = "{uri: #{uri}, message: #{response.message}, code: #{response.code}}"
    Rails.logger.error "\e[1;31m[ERROR]\e[0m" + message + log
  end

  def create_student(bit_user, course, domain)
    user = new_user_student(bit_user, course, domain)
    user.permissionings = [new_permissioning_student(user.id, course)]
    link_student(user.id, bit_user['idAlumno']) ? user : nil if user.save
  end
end
