class Catalog < ActiveRecord::Base

  validates :csv_file, presence: true, csv_file: true
  validates :status, presence: true, format: { with: /\A(pending|accepted|rejected)\Z/ }
  validates_presence_of :domain

  belongs_to :user

  has_many :catalog_errors

  mount_uploader :csv_file, FileUploader
end
