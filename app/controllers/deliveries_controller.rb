class DeliveriesController < ApplicationController
  include CoursesUtils
  include DeliveriesUtils
  include FiltersUtils
  helper_method :assigment
  before_filter :validations, only: :show
  before_filter :only_students, :only => [:index, :lapsed, :deliveries_course, :deliveries_course_lapsed]

  def index
    courses = student_subscribed_courses

    deliveries = courses.inject([]) do
      |accu, course|
      accu + course.deliveries
    end

    deliveries = deliveries.reject {|delivery| delivery.unpublish? }

    deliveries = deliveries.sort do
      |x,y| y.end_date <=> x.end_date
    end

    @today_deliveries = deliveries.clone.keep_if do
      |delivery|
      Time.now.to_datetime <= delivery.end_date.to_datetime and delivery.end_date.to_datetime <= Date.tomorrow
    end

    @tomorrow_deliveries = deliveries.clone.keep_if do
      |delivery|
      Date.tomorrow <= delivery.end_date.to_datetime and delivery.end_date.to_datetime <= (Date.tomorrow + 1.day)
    end

    @rest_of_deliveries = deliveries.clone.keep_if do
      |delivery|
      delivery.end_date.to_datetime >= (Date.tomorrow + 1.day)
    end
  end

  def lapsed
    @deliveries = student_lapsed_deliveries.paginate(per_page: CARDS_PER_PAGE, page: 1)
  end

  def deliveries_course
    @course = Course.find_by_id(params[:id])
    course_member?(current_user, @course)

    deliveries = @course.deliveries

    deliveries = deliveries.sort do
      |x,y| y.end_date <=> x.end_date
    end

    @today_deliveries = deliveries.clone.keep_if do
      |delivery|
      Time.now.to_datetime <= delivery.end_date.to_datetime and delivery.end_date.to_datetime <= Date.tomorrow
    end

    @tomorrow_deliveries = deliveries.clone.keep_if do
      |delivery|
      Date.tomorrow <= delivery.end_date.to_datetime and delivery.end_date.to_datetime <= (Date.tomorrow + 1.day)
    end

    @rest_of_deliveries = deliveries.clone.keep_if do
      |delivery|
      delivery.end_date.to_datetime >= (Date.tomorrow + 1.day)
    end
  end

  def deliveries_course_lapsed
    member = MembersInCourse.find_by_user_id_and_course_id(current_user.id, params[:id])
    unless member.nil?
      redirect_to root_path, flash: { error: t('.deliveries_controller.access_denied')} unless member.accepted
    else
      redirect_to root_path, flash: { error: t('.deliveries_controller.register')}
    end

    @course = Course.find_by_id(params[:id])
    @deliveries = course_lapsed_deliveries(@course).paginate(per_page: CARDS_PER_PAGE, page: 1)
  end

  def paginate_ajax
    page = params[:page]
    @type = params[:type]
    @next_page = page.to_i + 1

    case @type
    when 'lapsed'
      deliveries_raw = student_lapsed_deliveries
      @course = nil
    when 'course_lapsed'
      @course = Course.find_by_id(params[:course])
      deliveries_raw = course_lapsed_deliveries(@course)
    end

    @deliveries = deliveries_raw.paginate(per_page: CARDS_PER_PAGE, page: page)

    respond_to do |format|
      format.js { render 'deliveries/ajax/deliveries_paginate_ajax' }
    end
  end

  def show
    @wall = Wall.find_by_publication_type_and_publication_id( 'Delivery', @delivery.id )

    respond_to do |format|
      format.html
      format.json { render json: @course }
    end
  end

  def new
    @delivery = Delivery.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @delivery }
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def create

    if params[:delivery] && params[:delivery]["course_ids"]
      courses = params[:delivery]["course_ids"]
    else
      courses = []
    end

    @publication = []
    @error = false

    if params[:delivery]
      evaluation_periods_ids = params[:delivery].delete("evaluation_periods")
    else
      evaluation_periods_ids = []
    end

    evaluation_period_by_course = {}
    if evaluation_periods_ids
      evaluation_periods_ids.each do |id|
        evaluation_period = EvaluationPeriod.find_by_id(id)
        courses.push(evaluation_period.course_id)
        evaluation_period_by_course[evaluation_period.course_id] = id.to_i
      end
    end

    courses.uniq!
    params[:delivery].delete("course_ids")

    if !courses.empty?
      courses.each do |course|
        @delivery = Delivery.new(params[:delivery])
        @delivery.courses = [Course.find_by_id(course)]

        @delivery.evaluation_period_id = evaluation_period_by_course[course.to_i]

        if params[:delivery][:evaluation_period_id]
          @delivery.evaluation_period_id = params[:delivery][:evaluation_period_id].first.to_i
        end

        if @delivery.save!
          @typed = "Delivery"
          @az = @delivery
          @publication.push(Wall.find_by_publication_type_and_publication_id("Delivery",@delivery.id))
          activation_activity
          if(params[:files])
            params[:files].each do |asset_id|
              @asset = Asset.find(asset_id)
              @delivery.assets.push(@asset)
            end
          end

        else
          @error_evaluation_period = true
        end
      end
    else
      @error_course = true
    end
    respond_to do |format|
      format.js
    end
  end

  def update
    @delivery = Delivery.find_by_id(params[:id])
    @wall_publication = Wall.find_by_publication_type_and_publication_id("Delivery", @delivery.id)

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

  def destroy
    @delivery = Delivery.find_by_id(params[:id])
    @delivery.destroy

    respond_to do |format|
      format.html { redirect_to deliveries_url }
      format.json { head :no_content }
    end
  end

  # TODO: metodo requiere refactoring
  # TODO: verificar en donde se utiliza este metodo
  def assigment
    @assignment = Assignment.new(params[:assignment])
    @asset = Asset.new(params[:asset])

    if @assignment.save

      @delivery_from_assignment = Delivery.find(@assignment.delivery)

      @delivery_from_assignment.evaluation_criteria.each do |generate_rubres|
        @response_to_the_evaluation = ResponseToTheEvaluation.new
        @response_to_the_evaluation.name = generate_rubres.name
        @response_to_the_evaluation.comment_for_rubre = generate_rubres.description
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

  def validations
    @delivery = Delivery.find_by_id(params[:id])
    redirect_to root_path, flash: { error: "La tarea que intentas ver no existe ah sido borrada."} and return if @delivery.nil?
    #course_member?(current_user, @delivery.courses.first)
  end

end
