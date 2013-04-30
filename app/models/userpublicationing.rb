class Userpublicationing < ActiveRecord::Base
  belongs_to :user
  belongs_to :wall, :dependent => :destroy
end
