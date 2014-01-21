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
   id_event = []
  
   ####### docifica los eventos dentro de los cursos por sus tipos #######
   current_user.courses.each do |c|
    c.deliveries.each do |d|
      d.events.each do |de|
        id_event.push(de.id)
      end
    end

    c.surveys.each do |s|
      s.events.each do |se|
        id_event.push(se.id)
      end
    end
   end
   
   @date = params[:month] ? Date.parse(params[:month]) : Date.today
   @tasks = Event.where(:id => id_event)
   
   puts @tasks           
  end
  
  def connection
    
  end
  
  def test_calendar
  end

end
