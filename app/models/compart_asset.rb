class CompartAsset < ActiveRecord::Base
#  belongs_to :question, :dependent => :destroy
#  belongs_to :comment,  :dependent => :destroy
  belongs_to :delivery, :dependent => :destroy
 # belongs_to :assignment,  :dependent => :destroy  
#  belongs_to :asset, :dependent => :destroy  
end
