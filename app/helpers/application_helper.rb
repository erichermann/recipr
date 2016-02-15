module ApplicationHelper
  def link_to_add_fields(name, f, assoc)
    new_obj = f.object.class.reflect_on_association(assoc).klass.new
    fields = f.fields_for(assoc, new_obj, child_index: "new_#{assoc}") do |ifrm|
      render(assoc.to_s.singularize + '_fields', f: ifrm)
    end

    js_code = escape_javascript(fields)
    link_to(name, 'javascript:void(0)',
            onclick: h("javascript:add_fields(this, \"#{assoc}\",
            \"#{js_code}\")"),
            class: 'bold-14', remote: true)
  end

  def link_to_remove_fields(name, f, div_to_remove)
    js_code = escape_javascript(div_to_remove)
    click_code = "javascript:remove_fields(this, \"#{js_code}\")"
    f.hidden_field(:_destroy) + link_to(name, 'javascript:void(0)',
                                        onclick: h(click_code),
                                        class: 'bold-12')
  end

  def flash_class_for(flash_type)
    case flash_type
    when 'info'
      'alert-success'
    when 'error'
      'alert-error'
    when 'alert'
      'alert-block'
    when 'notice'
      'alert-info'
    end
  end

  def edit_link(path, options = {})
    link_to(image_tag('icons/pencil.png', border: 0), path, options)
  end

  def delete_link(path, options = {})
    link_to(image_tag('icons/cross-circle.png', border: 0), path,
            { confirm: 'Are you sure?', method: :delete }.merge(options))
  end
end
