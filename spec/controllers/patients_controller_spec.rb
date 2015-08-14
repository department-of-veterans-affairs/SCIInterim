require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  let(:user) { create(:user) }
  let(:patient) { create(:patient) }

  it "does not allow destroy" do
    sign_in user
    patient.save!
    expect { delete :destroy, id: patient.id }.to change(Patient, :count).by(0)
  end
end
