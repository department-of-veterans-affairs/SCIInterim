json.array!(@acute_rehab90_days) do |acute_rehab90_day|
  json.extract! acute_rehab90_day, :id
  json.url acute_rehab90_day_url(acute_rehab90_day, format: :json)
end
