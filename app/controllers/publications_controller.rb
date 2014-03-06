class PublicationsController < ApplicationController

	def show_template_on_modal

		if ( params[:type] == 'wall')
			@publication = Wall.find(params[:id])

    elsif ( params[:type] == 'task')
      event = Event.find(params[:id])
      puts '=========================='
  		  puts event.to_yaml
      puts '=========================='

    	@publication = Wall.find_by_publication_id_and_publication_type(event.schedule_id, event.schedule_type)
    end

    respond_to do |format|
      format.js
    end
	end

end
