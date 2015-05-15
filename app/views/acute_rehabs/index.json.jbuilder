json.array!(@acute_rehabs) do |acute_rehab|
  json.extract! acute_rehab, :id
  json.url acute_rehab_url(acute_rehab, format: :json)
end
