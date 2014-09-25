class Managers::CoursesController < Managers::BaseController
  def index
    @courses = Course.where(:network_id => current_network.id)
  end

  def show
    @course = Course.find_by_id params[:id]
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(params[:course])
    @course.network = current_network
    respond_to do |format|
      if @course.save
        event_data = {
          'Title'   => @course.title.capitalize,
          'Type'    => @course.public_status.capitalize,
          'Network' => current_network.name.capitalize
        }
        track_event current_user.id, 'Courses', event_data

        teachers = params["teachers"]
        unless teachers.nil? then 
          teachers.each do |teacher|
            @member = MembersInCourse.new
            @member.user_id = teacher.first.to_i
            @member.course_id  =  @course.id
            @member.accepted   = true
            @member.owner      = true
            @member.network_id = current_network.id
            @member.title      = @course.title
            @member.save
          end
        end

        students = params["students"]
        unless students.nil? then 
          students.each do |student|
            @member = MembersInCourse.new
            @member.user_id    = student.first.to_i
            @member.course_id  =  @course.id
            @member.accepted   = true
            @member.owner      = false
            @member.network_id = current_network.id
            @member.title      = @course.title
            @member.save
          end
        end

        # @publication = Wall.find_by_publication_type_and_publication_id("Course",@course.id)
        # @az =  @course
        # @typed = "Course"
        # activation_activity
        # @courses = current_user.members_in_courses.limit(7)
        # @course_count = Course.count
        # @ccc = current_user.courses.where(:network_id => current_network.id)
        # @count_course_iam_member = @ccc.where(:active_status => true).count
        # @count_course_iam_member_and_owner = MembersInCourse.where(:user_id => current_user.id, :accepted => true, :owner => true).count

        # if @count_course_iam_member_and_owner == 0
        #   @miembro = MembersInCourse.where(course_id = @course.id).first
        #   @miembro.owner == true
        #   @miembro.save
        # end

        # redirect_to course_evaluation_schema_path(@course.id), flash: { success: "Se ha creado correctamente tu curso, edita tu forma de evaluación."} and return
        redirect_to managers_courses_path, flash: { success: 'Curso creado correctamente.' }
      else
        format.html { redirect_to :back }
      end
    end
    # redirect_to managers_courses_path, flash: { success: 'Curso creado correctamente.' }
  end

  def edit
    @course = Course.find_by_id params[:id]
  end

  def update
    redirect_to managers_courses_path, flash: { success: 'Curso editado correctamente.' }
  end

  def destroy
    redirect_to managers_courses_path, flash: { success: 'Curso borrado correctamente.' }
  end

  def import
    @courses = current_network.courses
  end

  def import_receiver
    network = current_network
    user_admin = current_user

    if Course.find_by_title_and_silabus("1","1").nil? then
      course = Course.new(:title => "1", :silabus => "1")
      course.save!
    else
      course = Course.find_by_title_and_silabus("1","1")
    end

    lastFile = Dir.glob("public/imports/import_courses_*").sort.last
    if lastFile.nil? then
      name = "import_courses_1.csv"
    else
      lastFile = lastFile.split("/").last
      nameFile = lastFile[0...-4]
      name = nameFile.succ + ".csv"
    end

    text = ""
    begin
      File.open(params[:file].path,'r').each do |line|
        text += line
      end


      path = "public/imports/" + name
      f = File.open(path,'w+')
      f.write(text)
      f.close

      course.delay.import(path,network,user_admin)
    rescue
      @noFile = true
    end

    @courses = network.courses
    
    redirect_to import_managers_courses_path
  end

end