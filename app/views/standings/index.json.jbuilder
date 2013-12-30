json.array!(@standings) do |standing|
  json.extract! standing, :id, :user_id, :contestant_id
  json.url standing_url(standing, format: :json)
end
