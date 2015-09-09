module ReportHelper
  def check_box_and_label_tag(var, label_text)
    check_box_tag("report[patient_attributes][#{var}]", 1, true) + label_tag("report[patient_attributes][#{var}]", label_text)
  end
end
