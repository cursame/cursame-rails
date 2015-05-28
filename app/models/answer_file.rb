class AnswerFile < ActiveRecord::Base
 belongs_to :answer
 validates :file,  presence: true
 mount_uploader :file, AnswerFilesUploader
end
