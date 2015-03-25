class LibrariesController < ApplicationController
  def index
    @libraries = current_network.libraries.reject { |library| library.storable.kind_of? Network }
    @files = current_network.library_files
  end

  def show
    library = Library.find params[:id]
    @files = library.library_files
  end
end
