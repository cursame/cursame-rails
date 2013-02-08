class Survey < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  
  has_many :surveyings
  has_many :courses, :through => :surveyings
  has_many :compart_assets
  has_many :assets, :through => :compart_assets
  has_many :events, as: :schedule
  

  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
  after_create do 
    
    Event.create :title => self.title, :description => self.description, :starts_at => self.publish_date, :ends_at => self.end_date, :schedule_id => self.id, :schedule_type => "Delivery", :user_id => self.user_id, :course_id => self.course_ids, :network_id => self.network_id      
    
      
  end
  
  end
end