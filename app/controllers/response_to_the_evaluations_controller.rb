class ResponseToTheEvaluationsController < ApplicationController
  def create
    @response_to_the_evaluation = ResponseToTheEvaluation.new(params[:response_to_the_evaluation])
     @response_to_the_evaluation.save
    if @response_to_the_evaluation.save 
      redirect_to :back
    end
  end

  def new
    @response_to_the_evaluation = ResponseToTheEvaluation.new
  end
  
  def update
      @response_to_the_evaluation = ResponseToTheEvaluation.find(params[:id])
      @response_to_the_evaluation.save
    respond_to do |format|    
     if @response_to_the_evaluation.save
       
        format.json
        format.js
     else
     end
    end
  end
end
