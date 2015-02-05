class WufooForm < ActiveRecord::Base
  has_many :wufoo_responses, dependent: :destroy
  has_many :wufoo_form_roles, dependent: :destroy
  belongs_to :showable, polymorphic: true
  attr_accessible :form_id, :showable
end
