class LibraryFilesController < ApplicationController
  def create
    LibraryFile.create params[:library_file]
  end
end
