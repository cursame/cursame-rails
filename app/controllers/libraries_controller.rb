class LibrariesController < ApplicationController
  def index
    @libraries = current_network.libraries.reject { |library| library.storable.kind_of? Network }
    @files = current_network.files
  end

  def show
    library = Library.find params[:id]
    @files = library.files
  end

  def new
    @library = Library.new
  end

  def create
    Library.create(params[:library]) do |library|
      library.network  = current_network
      library.storable = current_network.library
    end
    redirect_to libraries_path
  end
end
