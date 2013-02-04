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

  # POST /assignments
  # POST /assignments.json
  def create
    @assignment = Assignment.new(params[:assignment])
    @asset = Asset.new(params[:asset])
    @response_to_the_evaluation = ResponseToTheEvaluation.new(params[:response_to_the_evaluation])
    
    
    respond_to do |format|
      if @assignment.save
           @delivery_from_assignment = Delivery.find(@assignment.delivery_id)
                @delivery_from_assignment.areas_of_evaluations.each do |generate_rubres|
                  @response_to_the_evaluation.name = generate_rubres.name
                  @response_to_the_evaluation.comment_for_rubre = generate_rubres.description
                  @response_to_the_evaluation.evaluation_porcentage = generate_rubres.evaluation_percentage
                  @response_to_the_evaluation.assignment_id = @assignment.id
                  @response_to_the_evaluation.save
                  
                end
        format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
        format.json { render json: @assignment, status: :created, location: @assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assignments/1
  # PUT /assignments/1.json
  def update
    @assignment = Assignment.find(params[:id])

    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
        format.html { redirect_to :back, notice: 'Assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy

    respond_to do |format|
      format.html { redirect_to assignments_url }
      format.json { head :no_content }
    end
  end
end
