class Survey < ActiveRecord::Base
 # attr_accessible  :title, :description, :starts_at, :ends_at, :schedule_id, :schedule_type, :user_id, :network_id, :course_id, :show
  
  has_many :questions, :dependent => :destroy
  has_many :surveyings
  has_many :courses, :through => :surveyings
  has_many :compart_assets
  has_many :assets, :through => :compart_assets
  has_many :events, as: :schedule
  belongs_to :network

  belongs_to :user
  has_many :activities, as: :activitye
  
  #comentarios para las surveys
  has_many :comments
  acts_as_commentable 

  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
  
  after_create do     
    Event.create :title => self.name, :starts_at => self.publish_date, :ends_at => self.end_date, :schedule_id => self.id, :schedule_type => "Survey", :user_id => self.user_id, :course_id => self.course_ids, :network_id => self.network_id      
    User.all.each do |u|
      Notification.create :user => u, :notificator => self, :kind => 'new_survey_on_course'          
      Wall.create :user => u, :publication => self, :network => self.network
    end      
  end
  
  def self.user
    User.last
  end
  
end