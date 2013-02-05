class Delivery < ActiveRecord::Base
  scope :active_inactive
  scope :courses
  has_many :deliveries_courses
  has_many :courses, :through => :deliveries_courses, :dependent => :destroy
  has_many :areas_of_evaluation
  has_many :assignments
  has_many :areas_of_evaluations
  belongs_to :user
  has_many :delivery_assets
  has_many :assets, :through => :delivery_assets
  
  
 # attr_accessible :dk_assets,  :title, :porcent_of_evaluation, :description, :publish_date, :end_date, :assets_attributes, :course_ids,  :file, :encryption_code_to_access, :user_id
  
  accepts_nested_attributes_for :areas_of_evaluations
  accepts_nested_attributes_for :assets
  accepts_nested_attributes_for :assignments
  accepts_nested_attributes_for :assignments, :assets
  
    
  def self.published_active
      self.update_attributes(:published => true)
      #Delivery.published!
  end
  
  def self.published_inactive
      self.update_attributes(:published => false)
      #Delivery.published!
      
  end
  
  def self.time_now
    @time = DateTime.now
  end
  
  def self.active_inactive
      puts "correindo deliveries"
      case
        when Delivery.publish_date == time_now
            published_active
        when Delivery.end_date ==  time_now
            published_inactive
      end
   end
  

end
