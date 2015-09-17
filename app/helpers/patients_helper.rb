module PatientsHelper

  def foundation_class_for(flash_type)
    { success: 'alert-box success', error: 'alert-box danger', warning: 'alert-box warning'}[flash_type.to_sym]
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "text-center alert-box #{foundation_class_for(msg_type)} fade in", data: {alert: 'alert'}) do
        concat content_tag(:button, 'x'.html_safe, class: 'close', data: {dismiss: '#{foundation_class_for(msg_type)}'})
        concat message
      end)
      flash.clear
    end
    nil
  end
end
