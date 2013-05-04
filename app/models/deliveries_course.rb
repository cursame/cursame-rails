class DeliveriesCourse < ActiveRecord::Base
  attr_accessible :created_at, :updated_at, :course_id, :delivery_id

  belongs_to :course
  belongs_to :delivery, :dependent => :destroy
end
