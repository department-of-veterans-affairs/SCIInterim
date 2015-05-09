json.array!(@outpatient_episodes) do |outpatient_episode|
  json.extract! outpatient_episode, :id
  json.url outpatient_episode_url(outpatient_episode, format: :json)
end
