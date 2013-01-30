class QuestionAsset < ActiveRecord::Base
  belongs_to :asset
  belongs_to :question
end
