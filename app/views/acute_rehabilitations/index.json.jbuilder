json.array!(@acute_rehabilitations) do |acute_rehabilitation|
  json.extract! acute_rehabilitation, :id
  json.url acute_rehabilitation_url(acute_rehabilitation, format: :json)
end
