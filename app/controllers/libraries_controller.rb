class LibrariesController < ApplicationController
  def show
    @library = Library.find params[:id]
    @files = @library.library_files
  end
end
