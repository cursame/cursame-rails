class Message
  include ActiveAttr::Model

  attribute :subject
  attribute :content
  attribute :course_id
  attr_accessor :subject, :content, :course_id

  validates_presence_of :subject
  validates_presence_of :content
  validates_presence_of :course_id


  def course_id
  end

  def title
    return ""
  end
end
