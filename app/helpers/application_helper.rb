module ApplicationHelper
  def wrapped_form_for(resource, options = {}, &block)
    simple_form_for(resource, options, &block)
  end
end
