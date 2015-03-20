class ReportedContentsController < ApplicationController
  def create
    @success = ReportedContent.create(params[:reported_content]) ? true : false
    respond_to do |format|
      format.js
    end
  end
end