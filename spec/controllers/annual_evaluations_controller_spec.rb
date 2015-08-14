require 'rails_helper'

RSpec.describe AnnualEvaluationsController, type: :controller do
  let(:user) { create(:user) }
  let(:patient) { create(:patient) }

  it "does not allow destroy" do
    sign_in user
    annual_evaluation = create(:annual_evaluation)
    patient.episode_of_cares << annual_evaluation
    patient.save!
    expect { delete :destroy, patient_id: patient.id, id: annual_evaluation.id }.to change(AnnualEvaluation, :count).by(0)
  end
end
