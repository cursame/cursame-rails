class LibraryDirectoriesController < ApplicationController
  def new
    @directory = LibraryDirectory.new
  end

  def create
    LibraryDirectory.create params[:library_directory]
  end
end