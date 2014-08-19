# -*- coding: utf-8 -*-
class AssignmentsController < ApplicationController
  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assignments }
    end
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    @assignment = Assignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assignment }
    end
  end

  # GET /assignments/new
  # GET /assignments/new.json
  def new
    @assignment = Assignment.new
    @asset = Asset.new
    1.times do
      assets = @assignment.assets.build
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assignment }
    end

  end

  # GET /assignments/1/edit
  def edit
    @assignment = Assignment.find(params[:id])
  end

  # TODO: metodo requiere refactoring
  # TODO: verificar en donde se utiliza este metodo
  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(params[:assignment])
    @assignment.user_id = current_user.id
    @asset = Asset.new(params[:asset])
    @asset.save!

    if @assignment.save

      if(params[:files])
        params[:files].each do |asset_id|
          @asset = Asset.find(asset_id)
          @delivery.assets.push(@asset)
        end
      end

      @publication = Wall.find_by_publication_type_and_publication_id("Delivery",@delivery.id)
      @delivery_from_assignment = Delivery.find(@assignment.delivery)

      @delivery_from_assignment.evaluation_criteria.each_with_index do | generate_rubres, index |
        @response_to_the_evaluation = ResponseToTheEvaluation.new(params[:response_to_the_evaluation])
        @response_to_the_evaluation.name = generate_rubres.name
        @response_to_the_evaluation.comment_for_rubre = generate_rubres.description
        @response_to_the_evaluation.assignment_id = @assignment.id
        @response_to_the_evaluation.save
      end

      @typed = "Assignment"
      @az    =  @assignment
      activation_activity

      if @activity.save
        redirect_to :back
      end
    end
  end

  def update
    @assignment = Assignment.find_by_id params[:id]

    if Grade.find_by_gradable_id(params[:id]).nil?
      grade_assignment = Grade.new
      grade_assignment.gradable_id = params[:id]
      grade_assignment.gradable_type = 'Delivery'
      grade_assignment.user_id = @assignment.user_id
      grade_assignment.score = 0
      if grade_assignment.save
        @assignment.grade = grade_assignment
      else
        redirect_to :back, flash: { error: "Error: No se pudo calificar correctamente la tarea" } and return
      end
    end

    @assignment.update_attributes params[:assignment]

    if @assignment.grade.save
      Notification.create users: [@assignment.user], notificator: @assignment, kind: 'new_accomplishment_on_assignment'
      the_flash = { success: "Se ha calificado correctamente la tarea." }
    else
      the_flash = { error: "Ha ocurrido un error al calificar la tarea." }
    end

    redirect_to evaluate_delivery_response_path(@assignment), flash: the_flash
  end

  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy

    respond_to do |format|
      format.html { redirect_to assignments_url }
      format.json { head :no_content }
    end
  end

  def delivery_responce
    respond_to do |format|
      format.js
    end
  end
end
