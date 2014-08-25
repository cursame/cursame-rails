# -*- coding: utf-8 -*-
class CalendarController < ApplicationController

  def set_xhr_flash
    flash.discard if request.xhr?
  end

  def correct_safari_and_ie_accept_headers
    ajax_request_types = ['text/javascript', 'app/json', 'text/xml']
    request.accepts.sort! { |x, y| ajax_request_types.include?(y.to_s) ? 1 : -1 } if request.xhr?
  end

  def index
    # TODO: agregar caso de maestro y admin
    @tasks = current_user.courses.map { |course| course.course_events }.flatten
    @date  = params[:month] ? Date.parse(params[:month]) : Date.today
    @today = Time.now
  end

  def activities_for_today
    activities = []
    current_user.courses.each do |c|
      date = Time.now + 3.days
      time_for_expire = date.strftime('%d/%m/%Y')

      c.deliveries.each do |d|
        @assignment = d.assignments.where(user_id: current_user.id, delivery_id: d.id ).count
        if @assignment == 0
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

      end

      c.surveys.each do |s|

        @surveys = s.user_surveys.where(user_id: current_user.id, survey_id: s.id ).count
        if @surveys == 0
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

end
