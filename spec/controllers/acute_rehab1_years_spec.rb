# Controller: Acute Rehab 1 Year
#
#
#
describe AcuteRehab1YearsController do

  describe '#new' do

    #Scenario: Access new acute rehab 1yr report
    #  Given I am not logged in
    #  When I attempt to access a new acute rehab 1yr report
    #  Then I get redirected back to the login page
    it 'should redirect non-logged in users to login page' do
      get :new, use_route: :acute_rehab1_years
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'should redirect to patient #edit view after being updated' do
      patient = create(:patient)
      user = create(:user)
      ar1yr = create(:acute_rehab1_year)
      sign_in user

      binding.pry

      post :create, use_route: :patients, patient_id: patient.patient_id
      expect(response).to redirect_to(edit_patient_path(patient.patient_id))
    end

  end

end


# post :update, course_id: @section.course_id, id: @section.id, section: {name: @section.name,course_id: @section.course_id}
