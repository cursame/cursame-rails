class LibraryFilesController < ApplicationController
  def create
    LibraryFile.create params[:library_file] do |file|
      file.user = current_user
    end
    redirect_to root_path
  end
end
