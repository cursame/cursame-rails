# encoding: UTF-8
module ApplicationHelper
  def link_to_remove_fields(name, f, options, toId)
    f.hidden_field(:_destroy, class: '_destroy') + link_to_function(name, "remove_fields(this, \""+toId+"\")", options)
  end

  def link_to_add_fields(name, f, association, options, toId, id)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render('/surveys/'+association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\", \""+toId+"\", \""+id+"\")", options)
  end

  def date_format(date, format)
    case format
    when 'normal' then localize(date, format: '%e de %B del %Y')
    end
  end

  def active_class(comparator, controller=nil)
    if comparator.class == String
      return params[:action] == comparator ? " active" : ""
    else
      if comparator.include?(params[:action]) && controller == params[:controller]
        return " active"
      end
    end
  end

  def evaluation_score(score)
    number_with_precision(score, precision: 1, strip_insignificant_zeros: true)
  end

  def cursame_percentage(course)
    cursame_criteria = course.evaluation_criteria.keep_if { |criterium| ['cursame_deliveries', 'cursame_surveys', 'cursame_discussions'].include? criterium.name }
    cursame_criteria.inject(0) { |sum, criterium| sum + criterium.evaluation_percentage}
  end

  def library_file_notification_message(notification)
    library_type = notification.notificator.location.storable
    case library_type
    when Network
      "<span class='as-link'> #{notification.notificator.user.name}</span>
      #{ t('.activity_feed.shared_file_in_the') } <span class='as-link'> #{ t('.activity_feed.public_library') }<span class='as-link'>".html_safe
    when Course
      "<span class='as-link'> #{notification.notificator.user.name}</span>
      #{ t('.activity_feed.shared_file_in') } <span class='as-link'>#{library_type.title}<span class='as-link'>".html_safe
    when Library
      "<span class='as-link'> #{notification.notificator.user.name}</span>
      #{ t('.activity_feed.shared_file_in') } <span class='as-link'>#{notification.notificator.location.title}<span class='as-link'>".html_safe
    end
  end
end
