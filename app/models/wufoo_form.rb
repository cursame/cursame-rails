class WufooForm < ActiveRecord::Base
  has_many :wufoo_responses, dependent: :destroy
  has_many :wufoo_form_roles, dependent: :destroy
  has_many :roles, through: :wufoo_form_roles
  belongs_to :showable, polymorphic: true
  attr_accessible :identifier, :init_date, :term_date, :role_ids
end
