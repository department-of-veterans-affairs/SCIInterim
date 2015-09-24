class ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def download
    render xlsx: 'export.xlsx', disposition: 'inline', locals: {
      xlsx_use_shared_strings: true,
      xlsx_author: "SCI Interim"
    }
  end

  def results
    # TODO(awong): Do we want to return empty?
    return Patient.where('1 = 0') if !params[:filter] # Return empty result if no filter given.
    # TODO(awong): Should we use strong params?
    Patient.where("assigned_sci_hub_id=:hub", params[:filter])
  end
  helper_method :results

  # Takes the set of options and creates a list of section_name/attribute_list
  # pairs that can be used to render an export configuration page.
  #
  # TODO(awong): This incorrectly adds spaces into some of the attribute names.
  # The "prefix" needs to be the pre-camelcased version.
  def export_config
    def squish_options(model, prefix, option_list, attr_list)
      export_options = []
      nested_attributes = Set.new(model.nested_attributes_options.keys)

      option_list.each do |key, value|
        if value.is_a?(Hash)
          nested_section = key.to_s.split("_").map { |word| word.capitalize }.join(" ")
          nested_section = "#{prefix}[#{nested_section}]" if prefix != ''
          association = model.reflect_on_association(key)
          if association.macro == :has_many || !nested_attributes.include?(key)
            section_attrlist = []
            export_options << [nested_section, section_attrlist]
            export_options.concat(squish_options(association.klass, '', value, section_attrlist))
          else
            # This is a has_one or a belongs_to relation and is nested.
            squish_options(association.klass, nested_section, value, attr_list)
          end
        else
          if prefix.empty?
            attr_list << key
          else
            attr_list << "#{prefix}[#{key}]"
          end
        end
      end
      export_options
    end

    patient_attributes = []
    [['Patient', patient_attributes]].concat(
      squish_options(Patient, '', all_export_options, patient_attributes))
  end
  helper_method :export_config

  # Helper to make the view code for the accordian less of a mess.
  # All this does is return "active" the first time and then an empty
  # string every other time. This lets us mark the first section active.
  def returns_active_once
    if @active_class.nil?
      @active_class = ""
      "active"
    else
      @active_class
    end
  end
  helper_method :returns_active_once

  def all_export_options
    @all_export_options ||= Patient.all_attributes
  end

 private
 def report_params
   params.permit(:filter).permit(
     :hub,
   )
   params.permit(:export).permit(
     acute_rehabs: AcuteRehab.attribute_names,
     annual_evaluations: AnnualEvaluation.attribute_names,
     omrs: Omr.attribute_names,
     patient: Patient.attribute_names,
   )
 end
end
