json.array!(@patients) do |patient|
  json.extract! patient, :id, :patient_id, :first_name, :last_name :ssn, :dob
  json.url patient_url(patient, format: :json)
end
