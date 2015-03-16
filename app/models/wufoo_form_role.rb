class WufooFormRole < ActiveRecord::Base
  belongs_to :wufoo_form
  belongs_to :role
  attr_accessible :wufoo_form, :role
end
