class GoogleFormRole < ActiveRecord::Base
  belongs_to :google_form
  belongs_to :role
  
  attr_accessible :google_form, :role
end
