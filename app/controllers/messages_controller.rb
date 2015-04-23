class MessagesController < ApplicationController

  def index
    @course = Course.find(params[:course_id])
    @member = MembersInCourse.find_by_user_id_and_course_id(current_user.id, @course.id)
    @message = Message.new
    if !@member.nil? then
      if @member.owner.nil? then
        @member.update_attributes(:owner => false)
      end
    end
    if current_role == "student" then
      redict_to courses_path, :notice => t('.messages_controller.no_send')
    end
  end

  def active_create
    course = Course.find(params[:course_id])
    message = Message.new(params[:message])
    course.members_in_courses.each do
      |member|
      begin
        mail = Notifier.send_email_members_in_course(member,message)
        mail.deliver
      rescue
      end
    end
    redirect_to :back
  end
    @typed = "Comment"
#    activation_activity
end
