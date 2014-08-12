class SurveyAsset < ActiveRecord::Base
  belongs_to :asset
  belongs_to :survey
end
