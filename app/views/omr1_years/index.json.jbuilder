json.array!(@omr1_years) do |omr1_year|
  json.extract! omr1_year, :id
  json.url omr1_year_url(omr1_year, format: :json)
end
