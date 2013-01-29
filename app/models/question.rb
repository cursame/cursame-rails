class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers, :dependent => :destroy
  has_many :compart_assets
  has_many :assets, :through => :compart_assets, :source => :question
   
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end