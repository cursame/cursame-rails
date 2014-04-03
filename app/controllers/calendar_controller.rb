# -*- coding: utf-8 -*-
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
   @today = Time.now
   @tasks = Event.where(:id => id_event)
   
   #puts @tasks
  end

  def activities_for_today
    activities = []
       current_user.courses.each do |c|
          date = Time.now + 3.days 
          time_for_expire = date.strftime('%d/%m/%Y') 
          
          c.deliveries.each do |d|

            case 
              when d.end_date.strftime('%d/%m/%Y') == (Time.now + 3.days).strftime('%d/%m/%Y') && d.state == 'published'
                activities.push({
                title: d.title,
                id: d.id,
                course: c.id,
                type: "Delivery",
                expira: "en 3 días"
                })
              when d.end_date.strftime('%d/%m/%Y') == (Time.now + 2.days).strftime('%d/%m/%Y') && d.state == 'published'
                activities.push({
                title: d.title,
                id: d.id,
                course: c.id,
                type: "Delivery",
                expira: "en 2 días"
                })
              when d.end_date.strftime('%d/%m/%Y') == (Time.now + 1.days).strftime('%d/%m/%Y') && d.state == 'published'
                activities.push({
                title: d.title,
                id: d.id,
                course: c.id,
                type: "Delivery",
                expira: "mañana"
                })
              when d.end_date.strftime('%d/%m/%Y') == Time.now.strftime('%d/%m/%Y') && d.state == 'published'
                activities.push({
                title: d.title,
                id: d.id,
                course: c.id,
                type: "Delivery",
                expira: "hoy"
                })
            end
            
          end

           c.surveys.each do |s|
            case 
              when s.end_date.strftime('%d/%m/%Y') == (Time.now + 3.days).strftime('%d/%m/%Y') && s.state == 'published'
                activities.push({
                title: s.title,
                id: s.id,
                course: c.id,
                type: "Survey",
                expira: "en 3 días"
                })
              when s.end_date.strftime('%d/%m/%Y') == (Time.now + 2.days).strftime('%d/%m/%Y') && s.state == 'published'
                activities.push({
                title: s.title,
                id: s.id,
                course: c.id,
                type: "Survey",
                expira: "en 2 días"
                })
              when s.end_date.strftime('%d/%m/%Y') == (Time.now + 1.days).strftime('%d/%m/%Y') && s.state == 'published'
                activities.push({
                title: s.title,
                id: s.id,
                course: c.id,
                type: "Survey",
                expira: "mañana"
                })
              when s.end_date.strftime('%d/%m/%Y') == Time.now.strftime('%d/%m/%Y') && s.state == 'published'
                activities.push({
                title: s.title,
                id: s.id,
                course: c.id,
                type: "Survey",
                expira: "hoy"
                })
            end
          end
       end

         if defined?(params[:activity_type]) && !params[:activity_type].nil?
             filter_type = activities.keep_if {|x| x[:type] == params[:activity_type]}
            else
             filter_type = activities
         end

    respond_to do |f|
      f.html
      f.json { render json: filter_type.paginate(:per_page => 3, :page => params[:page]) }
    end
  end
  
  def connection
    
  end
  
  def test_calendar
  end

end
