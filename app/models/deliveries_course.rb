class DeliveriesCourse < ActiveRecord::Base
  belongs_to :course
  belongs_to :delivery#, :dependent => :destroy
end
