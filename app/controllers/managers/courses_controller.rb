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
    redirect_to managers_courses_path, flash: { success: 'Curso creado correctamente.' }
  end

  def edit
    @course = Course.find_by_id params[:id]
  end

  def update
    redirect_to managers_courses_path, flash: { success: 'Curso editado correctamente.' }
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