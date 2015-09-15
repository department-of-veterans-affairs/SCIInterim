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
