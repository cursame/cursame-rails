class Answer < ActiveRecord::Base
  belongs_to :question
<<<<<<< HEAD
  #has_many :compart_assets, :dependent => :destroy
  has_many :assets, :through => :compart_assets

  attr_accessible :content, :correct, :question
=======
  attr_accessible :content, :correct
>>>>>>> 28f723ab4005a74f791a35f549485769bccd8a5a
end
