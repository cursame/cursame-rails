class School < ActiveRecord::Base
  attr_accessible :cct, :entity_id, :entity_name, :municipality_id, :municipality_name, :name, :subsystem
  has_one :course
end
