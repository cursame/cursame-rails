class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :compart_assets
  has_many :assets, :through => :compart_assets
  
end