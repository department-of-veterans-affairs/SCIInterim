json.array!(@omr90_days) do |omr90_day|
  json.extract! omr90_day, :id
  json.url omr90_day_url(omr90_day, format: :json)
end
