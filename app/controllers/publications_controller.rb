class PublicationsController < ApplicationController

	def show_template_on_modal

		if(params[:type] == 'wall')
			@publication = Wall.find(params[:id])
    else
    	event = Event.find(params[:id])
    	@publication = Wall.find_by_publication_id_and_publication_type(event.id,event.schedule_type)
    end

		respond_to do |format|
      format.js
    end
	end

end
