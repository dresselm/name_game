json.array!(@contestants) do |contestant|
  json.extract! contestant, :id, :first_name_id, :middle_name_id
  json.url contestant_url(contestant, format: :json)
end
