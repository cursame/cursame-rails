class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :answer_files, :dependent => :destroy
  accepts_nested_attributes_for :answer_files
end
