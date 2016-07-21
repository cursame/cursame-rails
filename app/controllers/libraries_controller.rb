class LibrariesController < ApplicationController
  def show
    @library = Library.find params[:id]
    @files = @library.library_files
  end

  def search
    raw_query = params[:query]
    if raw_query
      query = I18n.transliterate(raw_query.downcase.to_s)
      @library = Library.find_by_id(params[:id])
      files = LibraryFile.where("Lower(name) like ?", "%#{query}%")
      @library_files = files.keep_if { |file| file.library.id == @library.id }
      directories = LibraryDirectory.where("name like ?", "#{query}%")
      @library_directories = directories.keep_if { |directory| directory.library.id == @library.id }
      render 'libraries/shared/_search_results'
    else
      redirect_to courses_path, flash: { error: t('.courses_controller.search') }
    end
  end
end
