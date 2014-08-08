module EvaluationCriteriaHelper

  def link_to_add_evaluation_criteria(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render('shared/evaluation_criteria/evaluation_criteria_fields', f: builder)
    end
    link_to_function(name, "add_evaluation_criteria_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", class: "btn btn-small btn-secondary")
  end

end