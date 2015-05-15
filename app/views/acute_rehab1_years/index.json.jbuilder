json.array!(@acute_rehab1_years) do |acute_rehab1_year|
  json.extract! acute_rehab1_year, :id
  json.url acute_rehab1_year_url(acute_rehab1_year, format: :json)
end
