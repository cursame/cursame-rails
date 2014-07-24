class DeliveriesController < ApplicationController
  include CoursesUtils
  helper_method :condocourse
  before_filter :filter_protection, :only => [:show, :edit]
  helper_method :assigment

  def index
    # /deliveries
    # @today_deliveries 
    # @tomorrow_deliveries 
    # @rest_of_deliveries
    
    courses = student_subscribed_courses

    deliveries = courses.inject([]) do
      |accu, course|
      accu + course.deliveries
    end

    deliveries = deliveries.sort do
      |x,y| y.end_date <=> x.end_date
    end

    @today_deliveries = deliveries.clone.keep_if do
      |delivery|
      #p delivery
      Date.today <= delivery.end_date.to_datetime and delivery.end_date.to_datetime <= Date.tomorrow
    end

    @tomorrow_deliveries = deliveries.clone.keep_if do
      |delivery|
      Date.tomorrow <= delivery.end_date.to_datetime and delivery.end_date.to_datetime <= (Date.tomorrow + 1.day)
    end

    @rest_of_deliveries = deliveries.clone.keep_if do
      |delivery|
      delivery.end_date.to_datetime >= (Date.tomorrow + 1.day)
    end

    deliveries = []
    current_user.courses.each do |c|
      @member = MembersInCourse.find_by_course_id_and_user_id(c.id,current_user.id)
      c.deliveries.each do |d|
        case @member.owner
        when true
          if d.assignments.count == 0
            deliveries.push(d.id)
          end
        when false
          if d.assignments.where(:user_id => current_user.id).count == 0
            deliveries.push(d.id)
          end
        end
      end
    end
    @wall = current_network.walls.where(:publication_type => 'Delivery', :publication_id => deliveries).paginate(:per_page => 5, :page => params[:page]).order('created_at DESC')
    
  end

  def delivered
    # /deliveries/delivered
    # @deliveries Todas las tareas del usuario que ya entrego, excluyendo las que faltan por entregar
    deliveries = Assignment.find_all_by_user_id(current_user.id).map { |e| Delivery.find_by_id(e.delivery_id)}

    deliveries = deliveries.keep_if do |delivery|
      delivery.end_date.to_datetime < Time.now.to_datetime 
    end

    @deliveries = deliveries.sort do
      |x,y| y.end_date <=> x.end_date
    end

  end

  def deliveries_course
    # /courses/:id/deliveries
    # @today_deliveries 
    # @tomorrow_deliveries 
    # @rest_of_deliveries 
    # Solo para este curso
    deliveries = Course.find_by_id(params[:id]).deliveries

    deliveries = deliveries.sort do
      |x,y| y.end_date <=> x.end_date
    end

    @today_deliveries = deliveries.clone.keep_if do
      |delivery|
      #p delivery
      Date.today <= delivery.end_date.to_datetime and delivery.end_date.to_datetime <= Date.tomorrow
    end

    @tomorrow_deliveries = deliveries.clone.keep_if do
      |delivery|
      Date.tomorrow <= delivery.end_date.to_datetime and delivery.end_date.to_datetime <= (Date.tomorrow + 1.day)
    end

    @rest_of_deliveries = deliveries.clone.keep_if do
      |delivery|
      delivery.end_date.to_datetime >= (Date.tomorrow + 1.day)
    end

    @course = Course.find_by_id(params[:id])
  end

  def deliveries_course_delivered
    # /courses/:id/deliveries/delivered
    # @deliveries Todas las tareas del usuario que ya entrego de un curso especifico, excluyendo las que faltan por entregar
    deliveries = Assignment.find_all_by_user_id_and_course_id(current_user.id,params[:id]).map { |e| Delivery.find_by_id(e.delivery_id)}

    deliveries = deliveries.keep_if do |delivery|
      delivery.end_date.to_datetime < Time.now.to_datetime 
    end

    @deliveries = deliveries.sort do
      |x,y| y.end_date <=> x.end_date
    end

    @course = Course.find_by_id(params[:id])
  end

  def show
    @delivery = Delivery.find(params[:id])
    @assignment = Assignment.new(params[:assignment])
    @assignment.save
    @asset = Asset.new

    1.times do
      assets = @assignment.assets.build
    end

    @validation_member = @delivery.courses
    
    respond_to do |format|
      format.js
    end
  end

  # GET /deliveries/new
  # GET /deliveries/new.json
  def new
    @delivery = Delivery.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @delivery }
    end
  end

  # GET /deliveries/1/edit
  def edit
    @delivery = Delivery.find(params[:id])
  end

  # POST /deliveries
  # POST /deliveries.json
  def create
    courses = courses = params[:delivery] ? params[:delivery]["course_ids"] : nil
    @publication = []
    @error = false

    if courses && !courses.empty?
      courses.each do |course|
        @delivery = Delivery.new(params[:delivery])
        @delivery.courses = [Course.find_by_id(course)]
        if @delivery.save
          @typed = "Delivery"
          @az = @delivery
          @publication.push(Wall.find_by_publication_type_and_publication_id("Delivery",@delivery.id))
          activation_activity
          #actualizamos los assets del delivery
          if(params[:files])
            params[:files].each do |asset_id|
              @asset = Asset.find(asset_id)
              @delivery.assets.push(@asset)
            end
          end
        end
      end
    else
      @error = true
    end

    respond_to do |format|
      format.js
    end
  end

  # PUT /deliveries/1
  # PUT /deliveries/1.json
  def update
    @delivery = Delivery.find(params[:id])
    @publication = Wall.find_by_publication_type_and_publication_id("Delivery",@delivery.id)
    respond_to do |format|
      if @delivery.update_attributes(params[:delivery])
        format.html { redirect_to @delivery, notice: 'Delivery was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "edit" }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /deliveries/1
  # DELETE /deliveries/1.json
  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy

    respond_to do |format|
      format.html { redirect_to deliveries_url }
      format.json { head :no_content }
    end
  end

  def protection_to_index
    @course = Course.find(params[:id])
    @member = MembersInCourse.find_by_course_id_and_user_id(@course.id,current_user.id)
    if @member
      if @member.accepted
        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @course }
        end
      else
        redirect_to courses_path, :notice => "no has sido aceptado en este curso"
      end
    else
      redirect_to courses_path, :notice => "no has sido aceptado en este curso"
    end
  end

  def filter_protection
    @delivery = Delivery.find(params[:id])
    @validation_member = @delivery.courses
    @delivery.courses.each do |dc|
      @member = MembersInCourse.find_by_course_id_and_user_id(dc.id,current_user.id)
      if @member
        break
      else
        #    redirect_to courses_path, :notice => "no has sido aceptado en este curso"
      end
    end
    if @member
      if @member.accepted
        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @course }
        end
      else
        redirect_to courses_path, :notice => "no has sido aceptado en este curso"
      end
    else
      redirect_to courses_path, :notice => "no has sido aceptado en este curso"
    end
  end


  # TODO: metodo requiere refactoring
  # TODO: verificar en donde se utiliza este metodo
  def assigment
    @assignment = Assignment.new(params[:assignment])
    @asset = Asset.new(params[:asset])

    if @assignment.save

      @delivery_from_assignment = Delivery.find(@assignment.delivery)

      @delivery_from_assignment.areas_of_evaluations.each do |generate_rubres|
        @response_to_the_evaluation = ResponseToTheEvaluation.new
        @response_to_the_evaluation.name = generate_rubres.name
        @response_to_the_evaluation.comment_for_rubre = generate_rubres.description
        @response_to_the_evaluation.evaluation_porcentage = generate_rubres.evaluation_percentage
        @response_to_the_evaluation.assignment_id = @assignment.id
        @response_to_the_evaluation.save
      end
    end
  end

  def publish_unpublish_delivery_manualy
    @delivery = Delivery.find(params[:id])

    if @delivery.state == 'published'
      @delivery.state = 'unpublish'
      @delivery.end_date = Time.now
      @message = "Se ha despublicado esta tarea."
      @linkik = 'Publicar'

    else
      @delivery.state = 'published'
      @delivery.publish_date = Time.now
      @delivery.end_date = Time.now + 10.days
      @message = "Se ha republicado esta tarea agregando 10 dias desde ahora."
      @linkik = 'Ocultar'
    end

    @delivery.save!

    if @delivery.save
      respond_to do |format|
        format.js
      end
    end

  end
end
