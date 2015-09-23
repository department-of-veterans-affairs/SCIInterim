include Warden::Test::Helpers
Warden.test_mode!

# Feature: Annual Evaluations
#   As a user
#   I want to add or edit annual evalutions per patient
#   So I can properly record this type of episode of care
feature 'Annual Evaluations' do
  after(:each) do
    Warden.test_reset!
  end

  let (:patient) { create(:patient) }
  let (:subject) { create(:annual_evaluation) }

  # Scenario: Add Annual Evaluation to a patient
  #   Given I am a user
  #   When I add an Annual Evaluation to a patient record
  #   Then return to the patient record and can see the newly created Annual
  #        Evaluation
  scenario 'Add Annual Evaluation' do
    sign_in_user
    visit edit_patient_path(patient)

    expect(page).to have_content "Patient Personal Information"
    expect(find_field('SSN').value).to eql patient.ssn

    click_link("+ Annual Evaluation")
    expect(page).to have_content "New Annual Evaluation"

    fill_in "Date AE Offered", with: Time.now

    first(:button, "Save Annual Evaluation").click
    expect(current_url).to eql edit_patient_url(patient)

    # TODO(awong.dev): Verify annual evaluation shows.
  end

  scenario 'BMI is auto calculated on load and change' do
    sign_in_user
    visit edit_patient_annual_evaluation_path(patient, subject)
    click_link("Clinical")
    expect(field_labeled('Computed BMI', disabled: true).value.to_f).to eql subject.bmi
  end
end
