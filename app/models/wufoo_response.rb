class WufooResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :wufoo_form
  attr_accessible :wufoo_form, :user
end
