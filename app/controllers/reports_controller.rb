class ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def results
    return [] if !params[:report]
    Patient.where("assigned_sci_hub_id=:hub", report_params)
  end
  helper_method :results

 private
 def report_params
   params.require(:report).permit(
     :hub,
   )
 end
end
