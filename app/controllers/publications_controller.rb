class PublicationsController < ApplicationController

	def show_template_on_modal
		@publication = Wall.find(params[:id])
    
		respond_to do |format|
      format.js
    end
	end

end
