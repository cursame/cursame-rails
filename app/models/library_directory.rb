class LibraryDirectory < ActiveRecord::Base
  has_many :library_directories, as: :location, dependent: :destroy
  has_many :library_files, as: :location, dependent: :destroy

  belongs_to :location, polymorphic: true
  attr_accessible :name, :description

  def library
    case object
    when Library
      location
    when LibraryDirectory
      location.library
    end    
  end  
end
