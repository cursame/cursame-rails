module CoursesHelper
	include CoursesUtils

  def link_to_add_course_evaluation_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render('courses/shared/course_evaluation_schema_fields', :f => builder)
    end
    link_to_function(name, "add_course_evaluation_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

	def student_courses
		student_subscribed_courses
	end

	def teacher_courses
		teacher_published_courses
	end

  def school_entitites
    School.all.map { |s| [s.entity_name, s.entity_id ] }.uniq
  end
end
