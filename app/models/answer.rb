class Answer < ActiveRecord::Base
  belongs_to :question
  #has_many :compart_assets, :dependent => :destroy
  has_many :assets, :through => :compart_assets

  # attr_accessible :content, :correct, :question
end
