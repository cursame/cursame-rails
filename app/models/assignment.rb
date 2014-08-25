class Assignment < ActiveRecord::Base

  belongs_to :delivery
  belongs_to :user
  belongs_to :course

  has_many :assignment_assets, dependent: :destroy
  has_many :assets, through: :assignment_assets
  has_many :activities, as: :activitye, dependent: :destroy
  has_many :contents, as: :contentye, dependent: :destroy
  has_many :response_to_the_evaluations, as: :feedbackable, dependent: :destroy

  has_one :grade, as: :gradable, dependent: :destroy

  validates_presence_of :user
  validates_presence_of :course
  validates_presence_of :delivery

  accepts_nested_attributes_for :assets
  accepts_nested_attributes_for :response_to_the_evaluations
  accepts_nested_attributes_for :contents
  accepts_nested_attributes_for :grade

  # this is defined in config/initializers/auto_html.rb
  auto_html_for :brief_description do
    html_escape
    image
    link               target: "_blank", rel: "nofollow"
    dailymotion        width: "100%", height: 250
    google_map         width: "100%", height: 250
    google_video       width: "100%", height: 250
    metacafe           width: "100%", height: 250
    soundcloud         width: "100%", height: 250
    twitter            width: "100%", height: 250
    vimeo              width: "100%", height: 250
    youtube            width: "100%", height: 250
    prezi_with_wmode   width: "100%", height: 360
    livestrem_support  width: "100%", height: 360
    slideshare_support width: "100%"
    ustream_support    width: "100%"
    redcarpet
    simple_format
  end

  before_destroy do
    Notification.where(notificator_id: self.id, notificator_type: "Assignment").each { |notification| notification.destroy }
  end

  after_create do
    self.delivery.courses.each do |course|
      course.teachers.each { |teacher| teacher.settings_teacher.increment_deliveries if !teacher.settings_teacher.nil? }
    end
    users = self.delivery.courses.first.owners
    notification = Notification.create(:notificator => self, :users => users, :kind => 'new_assignment_on_delivery')
  end

end
