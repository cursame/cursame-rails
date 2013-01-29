# calendars are not (yet) a resource in the rails sense of thw word - we
# simply have a url like calendar/index to get the one and only calendar
# this demo serves up.
class CalendarController < ApplicationController
  layout 'calendarlayout'
  
  before_filter :correct_safari_and_ie_accept_headers
   after_filter :set_xhr_flash

   def set_xhr_flash
     flash.discard if request.xhr?
   end

   def correct_safari_and_ie_accept_headers
     ajax_request_types = ['text/javascript', 'app/json', 'text/xml']
     request.accepts.sort! { |x, y| ajax_request_types.include?(y.to_s) ? 1 : -1 } if request.xhr?
   end
   
  def index
    
      omniauth = request.env["omniauth.auth"]
       client = Google::APIClient.new
       puts" *************************"
       puts" *************************"
       
       @session = session[:token_calendar]
       @refresh_token = session[:refresh_token]
        
          client.authorization.access_token = @session
          puts" *************************"
          
          puts client.authorization.access_token = @session
          puts" *************************"
          client.authorization.refresh_token = @refresh_token                   
            
          puts" *************************"
          puts" *************************"
=begin
          service = client.discovered_api('calendar', 'v3')      
           @result = client.execute(
              :api_method => service.calendar_list.list,
              :parameters => {'calendarId' => 'calendarId'},
              :headers => {'Content-Type' => 'application/json'})
=end

=begin

   #####este codito sirve para accesder a la creación de eventos 
              service = client.discovered_api('calendar', 'v3')   
              event = {
                'summary' => 'Appointment',
                'location' => 'Somewhere',
                'start' => {
                  'dateTime' => '2011-06-03T10:00:00.000-07:00',
                  'timeZone' => 'America/Los_Angeles'
                },
                'end' => {
                  'dateTime' => '2011-06-03T10:25:00.000-07:00',
                  'timeZone' => 'America/Los_Angeles'
                },
                'recurrence' => ['RRULE:FREQ=WEEKLY;UNTIL=20110701T100000-07:00'],
                'attendees' => [
                  {
                    'email' => 'attendeeEmail'
                  },
                  #...
                ]
              }
              result = client.execute(:api_method => service.events.insert,
                                      :parameters => {'calendarId' => 'primary'},
                                      :body => JSON.dump(event),
                
                                      :headers => {'Content-Type' => 'application/json'})
              puts" *************************"
              puts result.data.id
              puts" *************************"
              
                result = client.execute(:api_method => service.calendars.get,
                                        :parameters => {'calendarId' => 'primary'})
                print result.data.summary

=end          
            service = client.discovered_api('calendar', 'v3')   
            page_token = nil
            result = result = client.execute(:api_method => service.events.list,
                                             :parameters => {'calendarId' => 'primary'})
            while true
              events = result.data.items
              events.each do |e|
                print e.summary
                 events_asimilate = result.data.items
                 @event = events_asimilate
                       print "recorriendo los eventos que envia google calendar"
                      events_asimilate.each do |ev_asimilate|
                        @start  = ev_asimilate.start
                        if @start
                        event = {
                          'summary' => "#{ev_asimilate.summary}",
                          'location'=> "#{ev_asimilate.location}",
                              'start' => {
                                'dateTime' => "#{ev_asimilate.start.dateTime}",
                              #  'timeZone' => "#{ev_asimilate.start.timeZone}"
                              },
                              'end' => {
                                'dateTime' => "#{ev_asimilate.end.dateTime}",
                               # 'timeZone' => "#{ev_asimilate.end.dateTime}"
                              },
                              'recurrence' => ["#{ev_asimilate.recurrence}"]
                          
                              }
                          
                         else
                          puts "este evento no puede ser llamado "
                         end
                        print "recorriendo los eventos que envia google calendar"
                        print event
                      end
                    
                
              end
              if !(page_token = result.data.next_page_token)
                break
              end
              result = result = client.execute(:api_method => service.events.list,
                                               :parameters => {'calendarId' => 'primary', 'pageToken' => page_token})
           
            
           
            end          
            
                   
  end
  
  def connection
    
  end

end
