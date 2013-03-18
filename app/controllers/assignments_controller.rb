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
    @assignment.user_id = current_user.id
    @asset = Asset.new(params[:asset])
    @asset.save!
    @assignment.save!
      puts "**************"
      puts "assignment save "
      puts "**************"

     if @assignment.save!
            puts "************************************************************************"
           @publication = Wall.find_by_publication_type_and_publication_id("Delivery",@delivery.id) 
           
           @delivery_from_assignment = Delivery.find(@assignment.delivery)
            puts  @delivery_from_assignment

                @delivery_from_assignment.areas_of_evaluations.each_with_index do | generate_rubres, index |

                  @response_to_the_evaluation = ResponseToTheEvaluation.new(params[:response_to_the_evaluation])
                  @response_to_the_evaluation.name = generate_rubres.name
                  @response_to_the_evaluation.comment_for_rubre = generate_rubres.description
                  @response_to_the_evaluation.evaluation_porcentage = generate_rubres.evaluation_percentage
                  @response_to_the_evaluation.assignment_id = @assignment.id
                  @response_to_the_evaluation.save

                   puts "******** se han generado las areas de evaluacion ************"

                end


                    @typed = "Assignment"
                    @az =  @assignment

                  ####### despues de guardar se crea la notificación de actividad con geo localización
                    activation_activity


             if @activity.save
                 redirect_to :back
             else
             end
        end
  end

  # PUT /assignments/1
  # PUT /assignments/1.json
  def update
    @assignment = Assignment.find(params[:id])
    
    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
         @assignment.response_to_the_evaluations.each do |docificate|
           ###### se actualiza el valor del rubro con respecto a la califiación
              #### alfredot_rifa_free_pro_forever
               puts docificate.rub_calification
               @valor_total = docificate.evaluation_porcentage
               puts   @valor_total
               @valor_recibido = docificate.figure  
               puts    @valor_recibido
               @division = (@valor_recibido)/100.0000
               puts @division.to_f
               @resultado =   @division.to_f * @valor_total.to_f
               puts  @resultado.to_f
               docificate.rub_calification = @resultado
               docificate.save
               puts (docificate.rub_calification).to_f
         end
        @sum_value_to_accomplishment =  @assignment.response_to_the_evaluations.sum(:rub_calification)
          @assignment.accomplishment =  @sum_value_to_accomplishment
          @assignment.save
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
