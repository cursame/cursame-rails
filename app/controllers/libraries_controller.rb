class LibrariesController < ApplicationController
  def index
    @libraries = current_network.libraries
    @files = current_network.files
  end
end
