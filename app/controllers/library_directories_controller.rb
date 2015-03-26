class LibraryDirectoriesController < ApplicationController
  def show
    @directory = LibraryDirectory.find(params[:id])
  end

  def new
    if params[:library_id]
      new_directory_for_library
    elsif params[:library_directory_id]
      new_directory_for_directory
    end
  end

  def create
    if params[:library_id]
      create_directory_for_library
    elsif params[:library_directory_id]
      create_directory_for_directory
    end
  end

  private
  def new_directory_for_library
    @parent_model = Library.find(params[:library_id])
    @directory = @parent_model.library_directories.build
  end

  def new_directory_for_directory
    @parent_model = LibraryDirectory.find(params[:library_directory_id])
    @directory = @parent_model.library_directories.build
  end

  def create_directory_for_library
    library = Library.find(params[:library_id])
    directory = library.library_directories.build(params[:library_directory])
    directory.save
    redirect_to library_path(library)
  end

  def create_directory_for_directory
    parent_directory = LibraryDirectory.find(params[:library_directory_id])
    directory = parent_directory.library_directories.build(params[:library_directory])
    directory.save
    redirect_to library_directory_path(parent_directory)
  end
end