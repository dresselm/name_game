json.array!(@games) do |game|
  json.extract! game, :id, :user_id, :winning_contestant_id, :losing_contestant_id
  json.url game_url(game, format: :json)
end
