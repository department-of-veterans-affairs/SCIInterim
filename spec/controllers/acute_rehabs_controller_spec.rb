describe AcuteRehabsController, type: :controller do
  let(:user) { create(:user) }
  let(:patient) { create(:patient) }

  it "does not allow destroy" do
    sign_in user
    acute_rehab = create(:acute_rehab)
    patient.episode_of_cares << acute_rehab
    patient.save!
    expect { delete :destroy, patient_id: patient.id, id: acute_rehab.id }.to change(AcuteRehab, :count).by(0)
  end
end
