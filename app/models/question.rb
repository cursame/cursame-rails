class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers, :dependent => :destroy
  has_many :question_assets, :dependent => :destroy
  has_many :assets, :through => :question_assets

  validates :answers,  presence: true
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :assets

  # attr_accessible :answers, :survey, :content
  
  def averageAnswer
    answers = self.answers
    size = answers.size
    average = 0.0
    answers.each do
      |answer|
      average += answer.correct ? 100 : 0
    end
    return average/size
  end
end
