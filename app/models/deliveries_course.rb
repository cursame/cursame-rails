class DeliveriesCourse < ActiveRecord::Base
  belongs_to :course, :dependent => :destroy
  belongs_to :delivery, :dependent => :destroy
end
