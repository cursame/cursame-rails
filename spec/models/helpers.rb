# coding: utf-8
module Helpers
  
# Recibe las mismas opciones que al crear una nueva network, pero agrega valores por
  # defecto.
  # Lista de valores por defecto:
  #   * subdomain = "testing"
  #   * name = subdomain
  #   * population = 10
  #   * Variables de tipo boolean son true
  # 
  # @return [Network]
  def add_network(options={})
    subdomain = options[:subdomain] || "testing"
    name = options[:name] || subdomain
    population = options[:population] || 10
    public_register = options[:public_register] || true
    free = options[:free] || true
    register_form = options[:register_form] || true
    welcom_message = options[:welcom_message] || ""
    image_front = options[:image_front] || ""
    logo = options[:logo] || ""
    logo_type = options[:logo_type] || ""
    titles = options[:titles] || ""
    personalize_domain = options[:personalize_domain] || ""
    authenticate_teacher = options[:authenticate_teacher] || true
    
    Network.create!(subdomain: subdomain, name: name, population: population, public_register: public_register,
                    free: free, register_form: register_form, welcom_message: welcom_message, image_front: image_front,
                    logo: logo, logo_type: logo_type, titles: titles, personalize_domain: personalize_domain,
                    authenticate_teacher: authenticate_teacher)
  end

  #
  # Example
  #        add_role(title: "Admin", description: "Admin de una red")
  #
  def add_role(options={})
    title = options[:title]
    description = options[:description]

    Role.create!(title: title, description: description)
  end

  # Recibe las mismas opciones que al crear un nuevo usuario, pero agrega
  # valores por defecto y se le debe de pasar la network y el role que este
  # usuario desea tener.
  #
  # Ejemplo:
  # add_user(network: network, role: role)
  #
  # @return [Network]
  def add_user(options={})

    email = options[:email]
    raise "Necesito un email" if email.nil?
    
    password = options[:password]
    raise "Necesito un password" if password.nil?
    
    first_name = options[:first_name]
    raise "Necesito un nombre" if first_name.nil?
    
    last_name = options[:last_name]
    raise "Necesito un apelliod" if last_name.nil?

    
    personal_url = options[:personal_url] || email
    avatar = options[:avatar] || ""
    coverphoto = options[:coverphoto] || ""
    facebook_link = options[:facebook_link] || ""
    twitter_link = options[:twitter_link] || ""
    bios = options[:bios] || ""
    tour_info = options[:tour_info] || ""
    accepted_terms = options[:accepted_terms] || true
    self_register = options[:self_register] || false
    
    network = options[:network]
    raise "Necesito saber la Red" if network.nil?
    
    role = options[:role]
    raise "Necesito saber el role" if role.nil?

    user = User.create!(email: email, password: password, first_name: first_name,
                        last_name: last_name, personal_url: personal_url,
                        avatar: avatar, coverphoto: coverphoto, facebook_link: facebook_link,
                        twitter_link: twitter_link, bios: bios, tour_info: tour_info,
                        accepted_terms: accepted_terms, self_register: self_register,
                        subdomain: network.subdomain, domain: "testing.com")
    
    Permissioning.create!(role_id: role.id, network_id: network.id, user_id: user.id)
    user
  end

  #
  # Valores minimos que debe recibir:
  #         add_course(owner: user, network: network)
  #
  def add_course(options={})

    title = options[:title] || "Test_Course"
    silabus = options[:silabus] || title
    init_date = options[:init_date] || DateTime.now
    finish_date = options[:finish_date] || init_date + 3.days
    public_status = options[:public_status] || "Private"
    avatar = options[:avatar]
    coverphoto = options[:coverphoto]
    survey_param_evaluation = options[:survey_param_evaluation] || 50
    delivery_param_evaluation = options[:delivery_param_evaluation] || 100 - survey_param_evaluation

    network = options[:network]
    raise "Necesito la network a la que pertence el curso." if network.nil?

    active_status = options[:active_status] || true
    
    owner = options[:owner]
    raise "Necesito saber quien sera el owner del curso." if owner.nil?

    course = Course.create!(title: title, silabus: silabus, init_date: init_date,
                            finish_date: finish_date, public_status: public_status,
                            avatar: avatar, coverphoto: coverphoto, survey_param_evaluation: survey_param_evaluation,
                            delivery_param_evaluation: delivery_param_evaluation, network_id: network.id,
                            active_status: active_status)

    add_members_in_course(user: owner, course: course, owner: true)
    
    course
  end

  # 
  # Valores minimos que debe recibir:
  #        add_members_in_course(user: user, course: course)
  #
  def add_members_in_course(options={})

    user = options[:user]
    raise "Necesito un usuario" if user.nil?
    
    course = options[:course]
    raise "Necesito el curso" if course.nil?
    
    owner = options[:owner] || false
    accepted = true
    active_status = true

    MembersInCourse.create!(user_id: user.id, course_id: course.id, accepted: accepted, owner: owner,
                            active_status: active_status)

  end

  #
  # Valores minimos que debe recibir:
  #
  #          add_delivery_course(user: user, course: course)
  #
  
  def add_delivery_course(options={})
    
    title = options[:title] || "Test_Delivery"
    description = options[:description] || title
    publish_date = options[:publish_date] || DateTime.now
    end_date = options[:end_date] || publish_date + 3.days
    porcent_of_evaluation = options[:porcent_of_evaluation] || 100

    user = options[:user]
    raise "Necesito un usuario" if user.nil?
    
    course = options[:course]
    raise "Necesito un curso" if course.nil?

    Delivery.create!(title: title, description: description, publish_date: publish_date, end_date: end_date,
                     porcent_of_evaluation: porcent_of_evaluation, user_id: user.id, network_id: course.id,
                     courses: [course])
  end

  #
  # Valores minimos que debe recibir:
  #
  #       add_assignment(delivery: delivery, user: user)
  #
  
  def add_assignment(options={})

    title = options[:title] || ""
    brief_description = options[:brief_description] || ""

    delivery = options[:delivery]
    raise "Necesito una tarea" if delivery.nil?

    course_id = delivery.courses.first.id
    brief_description_html = options[:brief_description_html] || brief_description
    
    user = options[:user]
    raise "Necesito un usuario" if user.nil?


    Assignment.create!(title: title, brief_description: brief_description, delivery_id: delivery.id,
                       course_id: course_id, user_id: user.id, brief_description_html: brief_description_html)
     
  end

  #
  #    {network: network, student_role: student_role, teacher_role: teacher_role, teacher: teacher,
  #     student: student, course: course, delivery: delivery, assignment: assignment}
  #
  
  def set_enviroment_for_evaluation
    network = add_network()

    student_role = add_role(title: "student", description: "estudiante de una red")
    teacher_role = add_role(title: "teacher", description: "profesor de una red")

    teacher = add_user(network: network, role: teacher_role, email: "teacher@cursa.me", password: "123456",
                       first_name: "Teacher", last_name: "Teacher")

    student = add_user(network: network, role: student_role, email: "student@cursa.me", password: "123456",
                       first_name: "Student", last_name: "Student")

    course = add_course(owner: teacher, network: network)
    add_members_in_course(user: student, course: course)

    delivery = add_delivery_course(user: teacher, course: course)

    assignment = add_assignment(delivery: delivery, user: student)

    {network: network, student_role: student_role, teacher_role: teacher_role, teacher: teacher,
     student: student, course: course, delivery: delivery, assignment: assignment}
    
  end
  
end
