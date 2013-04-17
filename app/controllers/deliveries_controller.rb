# -*- coding: utf-8 -*-
class DeliveriesController < ApplicationController
  # GET /deliveries
  # GET /deliveries.json
  helper_method :condocourse
  before_filter :filter_protection, :only => [:show, :edit]
  before_filter :protection_to_index, :only => [:index]
  helper_method :assigment
  def index
    @deliveries = Delivery.all
    @delivery = Delivery.new
    @course_accces = current_course
    @areas_of_evaluation = AreasOfEvaluation.new
    condocourse
    @count_course_iam_member_and_owner = current_user.members_in_courses.where(:owner => true).count
    areas_of_evaluations = @delivery.areas_of_evaluations.build

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @deliveries }
    end
  end

  def condocourse
   @course = current_course.id
  end

  # GET /deliveries/1
  # GET /deliveries/1.json
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
      format.html # show.html.erb
      format.json { render json: @delivery }
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
    courses = params[:delivery]["course_ids"]
    @publication = []

    courses.each do |course|

      @delivery = Delivery.new(params[:delivery])
      @delivery.courses = [Course.find_by_id(course)]
      # @areas_of_evaluation = AreasOfEvaluation.new(params[:areas_of_evaluation])
      # @compart_assets = CompartAsset.new(params[:compart_assets])
      # @assignment = Assignment.new(params[:assignment])


      if @delivery.save
        @typed = "Delivery"
        @az =  @delivery
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

    respond_to do |format|
      # format.json { render json: @delivery, status: :created, location: @delivery }
      format.js
    end
  end

  # PUT /deliveries/1
  # PUT /deliveries/1.json
  def update
    @delivery = Delivery.find(params[:id])
    @publication_m = Wall.find_by_publication_type_and_publication_id("Delivery",@delivery.id)
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

  def assigment
    @assignment = Assignment.new(params[:assignment])
    @asset = Asset.new(params[:asset])

    @assignment.save!
    puts "**************"
    puts "assignment save "
    puts "**************"

    if @assignment.save!
     @response_to_the_evaluation = ResponseToTheEvaluation.new
     puts "**************"
     @delivery_from_assignment = Delivery.find(@assignment.delivery)
     puts  @delivery_from_assignment

     @delivery_from_assignment.areas_of_evaluations.each do |generate_rubres|
      @response_to_the_evaluation.name = generate_rubres.name
      @response_to_the_evaluation.comment_for_rubre = generate_rubres.description
      @response_to_the_evaluation.evaluation_porcentage = generate_rubres.evaluation_percentage
      @response_to_the_evaluation.assignment_id = @assignment.id
      @response_to_the_evaluation.create
    end
  else
  end
end
end
