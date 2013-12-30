json.array!(@users) do |user|
  json.extract! user, :id, :email_address, :last_name, :url_token
  json.url user_url(user, format: :json)
end
