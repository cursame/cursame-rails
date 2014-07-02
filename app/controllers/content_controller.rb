class ContentController < ApplicationController

  def destroy
    @content = Content.find(params[:id])
    @content.destroy
    respond_to do |format|
      format.json
      format.js
    end
  end

end
