module ApplicationHelper
  def wrapped_form_for(resource, options = {}, &block)
    options[:html] = { class: 'form-vertical'}
    options[:wrapper] = :vertical_input_group
    options[:wrapper_mappings] = {
    #   check_boxes: :horizontal_radio_and_checkboxes,
    #   radio_buttons: :horizontal_radio_and_checkboxes,
      file: :horizontal_file_input,
      boolean: :horizontal_boolean
    }
    simple_form_for(resource, options, &block)
  end
end
