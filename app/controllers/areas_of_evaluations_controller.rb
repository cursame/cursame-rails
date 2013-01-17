class AreasOfEvaluationsController < ApplicationController
  # GET /areas_of_evaluations
  # GET /areas_of_evaluations.json
  def index
    @areas_of_evaluations = AreasOfEvaluation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @areas_of_evaluations }
    end
  end

  # GET /areas_of_evaluations/1
  # GET /areas_of_evaluations/1.json
  def show
    @areas_of_evaluation = AreasOfEvaluation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @areas_of_evaluation }
    end
  end

  # GET /areas_of_evaluations/new
  # GET /areas_of_evaluations/new.json
  def new
    @areas_of_evaluation = AreasOfEvaluation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @areas_of_evaluation }
    end
  end

  # GET /areas_of_evaluations/1/edit
  def edit
    @areas_of_evaluation = AreasOfEvaluation.find(params[:id])
  end

  # POST /areas_of_evaluations
  # POST /areas_of_evaluations.json
  def create
    @areas_of_evaluation = AreasOfEvaluation.new(params[:areas_of_evaluation])

    respond_to do |format|
      if @areas_of_evaluation.save
        format.html { redirect_to @areas_of_evaluation, notice: 'Areas of evaluation was successfully created.' }
        format.json { render json: @areas_of_evaluation, status: :created, location: @areas_of_evaluation }
      else
        format.html { render action: "new" }
        format.json { render json: @areas_of_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /areas_of_evaluations/1
  # PUT /areas_of_evaluations/1.json
  def update
    @areas_of_evaluation = AreasOfEvaluation.find(params[:id])

    respond_to do |format|
      if @areas_of_evaluation.update_attributes(params[:areas_of_evaluation])
        format.html { redirect_to @areas_of_evaluation, notice: 'Areas of evaluation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @areas_of_evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /areas_of_evaluations/1
  # DELETE /areas_of_evaluations/1.json
  def destroy
    @areas_of_evaluation = AreasOfEvaluation.find(params[:id])
    @areas_of_evaluation.destroy

    respond_to do |format|
      format.html { redirect_to areas_of_evaluations_url }
      format.json { head :no_content }
    end
  end
end
