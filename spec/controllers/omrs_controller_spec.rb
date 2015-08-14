require 'rails_helper'

RSpec.describe OmrsController, type: :controller do
  let(:user) { create(:user) }
  let(:patient) { create(:patient) }

  it "does not allow destroy" do
    sign_in user
    omr = create(:omr)
    patient.episode_of_cares << omr
    patient.save!
    expect { delete :destroy, patient_id: patient.id, id: omr.id }.to change(Omr, :count).by(0)
  end
end
