class Evaluation < ActiveRecord::Base

  belongs_to :qualifying, :polymorphic => true

  validates :qualifying_type, presence: true
  validates :qualifying_id, presence: true

  before_create do
    if self.score.nil?
      self.score = 0
    else
      self.score = 100 if self.score > 100
      self.score = 0 if self.score < 0
    end
  end
  
end
