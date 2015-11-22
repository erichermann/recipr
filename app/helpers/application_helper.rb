module ApplicationHelper
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new 
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |items_form| 
      render(association.to_s.singularize + '_fields', :f => items_form) 
    end 
    link_to(name, 'javascript:void(0)', :onclick => h("javascript:add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"), 
            :class=>'bold-14', remote: true) 
  end
   
  def link_to_remove_fields(name, f, div_to_remove)
    f.hidden_field(:_destroy) + link_to(name, 'javascript:void(0)', onclick: h("javascript:remove_fields(this, \"#{escape_javascript(div_to_remove)}\")"), :class=>'bold-12')
  end


  #def link_to_remove_fields(name, f, element_to_hide='')
  #  logger.debug("------element_to_hide: " + element_to_hide);
  #  f.hidden_field(:_destroy) + link_to(name, "javascript:remove_div_fields(this, '#{element_to_hide}')", :css_class=>'small')
  #end
  
  #def link_to_remove_fields(name, f, element_to_hide='')
  #  logger.debug("------element_to_hide: " + element_to_hide);
  #  f.hidden_field(:_destroy) + link_to(name, "javascript:remove_fields(this)", :css_class=>'small')
  #end
  
    
  #def link_to_add_fields(name, f, association, css_class='small')  
  #  new_object = f.object.class.reflect_on_association(association).klass.new  
  #  fields = f.fields_for(association, new_object, child_index: "new_#{association}") do |builder|  
  #    render(association.to_s.singularize + "_fields", :f => builder)  
  #  end  
  #  link_to name, "#", onclick: h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"), class: css_class
  #end 
  
  #def link_to_remove_fields(name, f, removal_class)
  #  link_to(name, "javascript:void(0);", onclick: "remove_fields(this);")
  #  #link_to(name, "javascript:remove_fields(this);", class: 'remove')
  #end

  #def link_to_add_fields(name, f, association)
  #  new_object = f.object.class.reflect_on_association(association).klass.new
  #  fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
  #      render(association.to_s.singularize + "_fields", :f => builder)
  #  end
  #  link_to(name, "javascript:void(0);", onclick: "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  #end
      
  #def link_to_add_fields(name, f, association)
  #  new_object = f.object.class.reflect_on_association(association).klass.new
  #  fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
  #    render(association.to_s.singularize + "_fields", :f => builder)
  #  end
  #  link_to name, "#", :onclick => h("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"), class: 'small', remote: true
  #end
 

  def edit_link(path, options = {})
    link_to(image_tag('icons/pencil.png', :border => 0), path, options)
  end

  def delete_link(path, options = {})
    link_to(image_tag('icons/cross-circle.png', :border => 0), path, { confirm: 'Are you sure?', :method => :delete }.merge(options))
  end
end
