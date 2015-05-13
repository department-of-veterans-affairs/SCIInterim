json.array!(@omrs) do |omr|
  json.extract! omr, :id
  json.url omr_url(omr, format: :json)
end
