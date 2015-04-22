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
    ## ALERT!! Esto no se está utilizando al parecer, el assignment se crea en 'courses_controller#assignment'
    @assignment = Assignment.new(params[:assignment])
    @assignment.user_id = current_user.id
    @asset = Asset.new(params[:asset])
    @asset.save!

    if @assignment.save
      # users = self.delivery.courses.first.owners
      # notification = Notification.create(:notificator => self, :users => users, :kind => 'new_assignment_on_delivery')
      # Notification.create users: [@assignment.user], notificator: @assignment, kind: 'new_assignment_on_delivery'

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

    if @assignment.update_attributes params[:assignment]
      Notification.create users: [@assignment.user], notificator: @assignment, kind: 'new_accomplishment_on_assignment'
      the_flash = { success: t('.assignments.correct') }
    else
      the_flash = { error: t('.assignments.error') }
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
