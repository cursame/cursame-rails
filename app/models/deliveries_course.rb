class DeliveriesCourse < ActiveRecord::Base
  belongs_to :course
  belongs_to :delivery
end
