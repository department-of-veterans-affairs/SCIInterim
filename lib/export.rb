def make_workbook
  patients = Patient.where("assigned_sci_hub_id=:hub", {hub: 1})
  Axlsx::Package.new do |p|
    wb = p.workbook
    export_config = {
      id: 1, first_name: 1, last_name: 1, ssn: 1,
      annual_evaluations: { id: 1, eval_offered: 1, updated_at: 1 },
      acute_rehabs: { id: 1, followup_1yr_date: 1, followup_90day_date: 1 },
      omrs: { id: 1, followup_1yr_date: 1, followup_90day_date: 1 },
    }
    fill_in_workbook(wb, export_config, patients)

    # Needed for Numbers support.
    p.use_shared_strings = true
    p.serialize('test.xlsx')
  end
end

# patient = [ :hi => 1, :bye => 1, :why => 1, bleh_with_many_attributes => [ :id => 1, :bye => 2, etc ]
def fill_in_workbook(wb, exports_config, patients)
  workbooks = {}.with_indifferent_access
  patients.each { |patient| convert_model(wb, workbooks, exports_config, patient, "Patient") }
end

def convert_model(wb, worksheets, config_root, model, name)
  if !worksheets.has_key?(name)
    current_sheet = worksheets[name] = wb.add_worksheet(name: name.to_s)
    # Add Headers
    # TODO(awong): Support collation order of keys.
    current_sheet.add_row config_root.reject { |_, value| value.is_a?(Hash) }.keys
  else
    current_sheet = worksheets[name] 
  end

  values = []
  config_root.each do |attr, value|
    association = model.class.reflect_on_association(attr)
    if association
      case association.macro
      when :has_many
        model.send(attr).each { |nested_model| convert_model(wb, worksheets, value, nested_model, attr) }
      when :belongs_to, :has_one
        # We need to put the model into our system
        convert_model(wb, worksheets, value, model.send(attr), attr)
      else
        raise "Unknown association type #{association.macro} for #{attr}."
      end
    else
      values << model.send(attr)
    end
  end
  current_sheet.add_row values

#  wb.add_worksheet(name: category.to_s) do |sheet|
#  exports_config.each do |category, attributes|
#    wb.add_worksheet(name: category.to_s) do |sheet|
#      sheet.add_row attributes.keys
#      patients.each do |patient|
#        values = []
#        attributes.each do |name, _|
#          case category
#          when :patient
#            values << patient.send(name)
#          when :annual_eval
#            patient.annual_evaluations.each { |annual_evaluation| values << annual_evaluation.send(name) }
#          when :acute_rehab
#            patient.acute_rehabs.each { |acute_rehab| values << acute_rehab.send(name) }
#          when :omr
#            patient.omrs.each { |omr| values << omr.send(name) }
#          end
#        end
#        sheet.add_row values
#      end
#    end
#  end
end
