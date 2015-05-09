json.array!(@episode_of_cares) do |episode_of_care|
  json.extract! episode_of_care, :id
  json.url episode_of_care_url(episode_of_care, format: :json)
end
