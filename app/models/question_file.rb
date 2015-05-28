class QuestionFile < ActiveRecord::Base
  belongs_to :question
  validates :file,  presence: true
  mount_uploader :file, QuestionFileUploader
end
