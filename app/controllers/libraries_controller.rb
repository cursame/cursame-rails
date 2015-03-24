class LibrariesController < ApplicationController
  def index
    @libraries = current_network.libraries.reject { |library| library.storable.kind_of? Network }
    @files = current_network.files
  end
end
