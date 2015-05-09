json.array!(@annual_evaluations) do |annual_evaluation|
  json.extract! annual_evaluation, :id
  json.url annual_evaluation_url(annual_evaluation, format: :json)
end
