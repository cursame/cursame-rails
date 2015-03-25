class LibraryDirectoriesController < ApplicationController
  def new
    @library = Library.find(params[:library_id])
    @directory = @library.library_directories.build
  end

  def create
    library = Library.find(params[:library_id])
    directory = library.library_directories.build(params[:library_directory])
    directory.save
    redirect_to library_path(library)
  end
end