class CatalogError < ActiveRecord::Base

  belongs_to :catalog

  validates_presence_of :email, :errors_message, :row, :field
  validates_associated :catalog

end
