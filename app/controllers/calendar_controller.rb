# calendars are not (yet) a resource in the rails sense of thw word - we
# simply have a url like calendar/index to get the one and only calendar
# this demo serves up.
class CalendarController < ApplicationController
 

   def set_xhr_flash
     flash.discard if request.xhr?
   end

   def correct_safari_and_ie_accept_headers
     ajax_request_types = ['text/javascript', 'app/json', 'text/xml']
     request.accepts.sort! { |x, y| ajax_request_types.include?(y.to_s) ? 1 : -1 } if request.xhr?
   end
   
  def index
   course_id = []
   current_user.courses.each do |c|
     course_id.push(c.id)
   end
   puts "#{course_id}"
   @date = params[:month] ? Date.parse(params[:month]) : Date.today
   @tasks = Event.where(:course_id => course_id)
   puts @tasks           
  end
  
  def connection
    
  end
  
  def test_calendar
  end

end
