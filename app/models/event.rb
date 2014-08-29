class Event < ActiveRecord::Base
   attr_accessible  :title, :description, :starts_at, :ends_at, :schedule_id, :schedule_type, :user_id, :network_id, :course_id, :date

  scope :before, lambda {|end_time| {:conditions => ["ends_at < ?", Event.format_date(end_time)] }}
  scope :after, lambda {|start_time| {:conditions => ["starts_at > ?", Event.format_date(start_time)] }}

  belongs_to :schedule, polymorphic: :true
  belongs_to :user
  has_many :activities, as: :activitye, :dependent => :destroy

  # need to override the json view to return what full_calendar is expecting.
  # http://arshaw.com/fullcalendar/docs/event_data/Event_Object/
  def as_json(options = {})
    {
      :id => self.id,
      :title => self.title,
      :description => self.description || "",
      :start => starts_at.rfc822,
      :end => ends_at.rfc822,
      :url => Rails.application.routes.url_helpers.event_path(id)
    }
  end

  def self.format_date(date_time)
    Time.at(date_time.to_i).to_formatted_s(:db)
  end

  def date
     self.ends_at
  end
end
