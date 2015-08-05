module ApplicationHelper
  def wrapped_form_for(resource, options = {}, &block)
    options[:html] = { class: 'form-vertical'}
    options[:wrapper] = :vertical_input_group
    options[:wrapper_mappings] = {
      file: :horizontal_file_input,
      boolean: :horizontal_boolean
    }
    simple_form_for(resource, options, &block)
  end
end
