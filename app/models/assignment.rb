class Assignment < ActiveRecord::Base
  belongs_to :delivery
  belongs_to :user
  belongs_to :course
  has_many :assignment_assets, :dependent => :destroy
  has_many :assets, :through => :assignment_assets
  has_many :response_to_the_evaluations, :dependent => :destroy
  has_many :activities, as: :activitye, :dependent => :destroy


  accepts_nested_attributes_for :assets
  accepts_nested_attributes_for :response_to_the_evaluations

  #autoconversion de links, links inteligentes
  auto_html_for :brief_description do
    html_escape
    image
    # This is defined in config/initializers/auto_html.rb
    dailymotion :width => "100%", :height => 250
    #flickr :width => 400, :height => 250
    google_map :width => "100%", :height => 250
    google_video :width => "100%", :height => 250
    metacafe :width => "100%", :height => 250
    soundcloud :width => "100%", :height => 250
    twitter :width => "100%", :height => 250
    vimeo :width => "100%", :height => 250
    youtube :width => "100%", :height => 250
    slideshare_support :width => "100%"
    ustream_support :width => "100%"
    prezi_with_wmode :width => "100%", :height => 360
    livestrem_support :width => "100%", :height => 360
    link :target => "_blank", :rel => "nofollow"
    redcarpet
    #sanitize
    simple_format
  end

  after_create do
    # Envia correo a todos los maestros de los cursos a los cuales pertenece
    # el delivery asociado al assignment.
    self.delivery.courses.each do
      |course|
      teachers = course.members_in_courses.keep_if {
        |member|
        member.owner == true
      }
      teachers.each do
        |teacher|
        teacher.user.settings_teacher.increment_deliveries if !teacher.user.settings_teacher.nil?
      end
    end
  end
end
