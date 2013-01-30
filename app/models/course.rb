class Course < ActiveRecord::Base
  
  mount_uploader :avatar, AvatarUploader
  mount_uploader :coverphoto, CoverphotoUploader
  has_many :members_in_courses 
  has_many :users, :through => :members_in_courses  
  has_many :deliveries_courses
  has_many :deliveries, :through => :deliveries_courses
  has_many :surveys
  has_many :assignments
  has_many :surveyings
  has_many :surveys, :through => :surveyings

   
  after_create do
      User.all.each do |u|
          Notification.create :user => u, :notificator => self, :kind => 'new_course_on_network'
      end   
  end

  def self.search(search)
    if search
      @searcher = find(:all, :conditions => ['title LIKE ?', "%#{search}%"])        
    else
      find(:all, :order => :title)
    end
  end
  
end
