json.array!(@names) do |name|
  json.extract! name, :id, :name, :is_first_name, :is_middle_name
  json.url name_url(name, format: :json)
end
