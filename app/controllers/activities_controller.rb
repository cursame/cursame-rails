class ActivitiesController < ApplicationController
  def create
    @activity = Activity.new(params[:activity])

     respond_to do |format|
        if @activity.save
          format.json
          format.js
        else
          format.json
          format.js
        end
     end

  end
  def new
      @activity = Activity.new
  end

  def show
    @activity = Activity.find(params[:id])

  end
end
