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
        @response_to_the_evaluation.evaluation_porcentage = generate_rubres.evaluation_percentage
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
    @assignment = Assignment.find(params[:id])

    if @assignment.response_to_the_evaluations.count != 0
      # con rubros
      if @assignment.update_attributes(params[:assignment])
        @assignment.response_to_the_evaluations.each do |docificate|
          ###### se actualiza el valor del rubro con respecto a la califiación
          #### alfredot_rifa_free_pro_forever
          @valor_total = docificate.evaluation_porcentage

          @valor_recibido = docificate.figure

          @division = (@valor_recibido)/100.0000

          @resultado =   @division.to_f * @valor_total.to_f

          docificate.rub_calification = @resultado
          docificate.save

        end
        @sum_value_to_accomplishment =  @assignment.response_to_the_evaluations.sum(:rub_calification)
        @assignment.accomplishment =  @sum_value_to_accomplishment
        @assignment.save
      end
    else
      # sin rubros
      @assignment.rub_calification = (params[:assignment])[:rub_calification].to_f
      @assignment.accomplishment = @assignment.rub_calification
      @assignment.save
    end

    url = evaluate_delivery_response_path(@assignment)

    if @assignment.save
      redirect_to url, flash: { success: "Se ha calificado correctamente la tarea." }
    else
      redirect_to url, flash: { error: "Ha ocurrido un error al calificar la tarea." }
    end
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
