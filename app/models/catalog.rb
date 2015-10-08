class Catalog < ActiveRecord::Base

  validates :csv_file, presence: true, csv_file: true, on: :create
  validates :status, presence: true, format: { with: /\A(pending|accepted|rejected)\Z/ }
  validates_presence_of :domain

  belongs_to :user

  has_many :catalog_errors, dependent: :destroy

  mount_uploader :csv_file, FileUploader

  after_commit :import_users

  def import_users
    if pending?
      CatalogCSVParserWorker.perform_async(id)
    end
  end

  def pending?
    status == 'pending'
  end
end
