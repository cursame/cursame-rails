module ApplicationHelper
  def link_to_remove_fields(name, f, options, toId)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this, \""+toId+"\")", options)
  end
  
  def link_to_add_fields(name, f, association, options, toId)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render('/surveys/'+association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\", \""+toId+"\")", options)
  end

  # para la paginacion por scroll
  def pageless(total_pages, url=nil, container=nil)
    puts '------------------'
    puts total_pages
    puts '------------------'
    opts = {
      :totalPages => total_pages,
      :url        => url,
      :loaderMsg  => 'Loading more results',
      :loaderImage => image_path("load.gif")
    }
    
    container && opts[:container] ||= container
    
    javascript_tag("$('#timeline').pageless(#{opts.to_json});")
  end
end