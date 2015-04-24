json.array!(@patients) do |patient|
  json.extract! patient, :id, :patient_id, :name, :ssn, :dob
  json.url patient_url(patient, format: :json)
end
