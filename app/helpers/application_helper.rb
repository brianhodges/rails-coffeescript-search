module ApplicationHelper
    def button_to_add_associated(name, f, association, html_options={})
        new_object = f.object.send(association).klass.new
        id = new_object.object_id
        fields = f.fields_for(association, new_object, child_index: id) do |builder|
          render(association.to_s.singularize + "_fields", f: builder)
        end
        opt = html_options.merge type: 'button', onclick: "addAssociated(this)", data: {id: id, fields: fields.gsub("\n", '&#xA;')}
        button_tag(name, opt)
    end
end
