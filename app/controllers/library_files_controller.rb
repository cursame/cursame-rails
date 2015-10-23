class LibraryFilesController < ApplicationController
  def new
    if params[:library_id]
      new_file_for_library
    elsif params[:library_directory_id]
      new_file_for_directory
    end
  end

  def create
    if params[:library_id]
      create_file_for_library
    elsif params[:library_directory_id]
      create_file_for_directory
    end
  end

  def destroy
    if params[:id]
      delete_file_for_library
    end
  end

  private

  def delete_file_for_library
    file = LibraryFile.find(params[:id])
    file.destroy
    flash[:success] = t('.library_files_controller.file_deleted')
    redirect_to library_path(current_network.library)
  end

  def new_file_for_library
    @parent_model = Library.find(params[:library_id])
    @file = @parent_model.library_files.build
  end

  def new_file_for_directory
    @parent_model = LibraryDirectory.find(params[:library_directory_id])
    @file = @parent_model.library_files.build
  end

  def create_file_for_library
    library = Library.find(params[:library_id])
    file = library.library_files.build(params[:library_file])
    file.user = current_user
    file.save
    redirect_to library_path(library)
  end

  def create_file_for_directory
    directory = LibraryDirectory.find(params[:library_directory_id])
    file = directory.library_files.build(params[:library_file])
    file.user = current_user
    file.save
    redirect_to library_directory_path(directory)
  end
end
