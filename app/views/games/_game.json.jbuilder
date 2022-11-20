json.extract! game, :id, :name, :description, :publish_date, :price, :stock, :created_at, :updated_at
json.url game_url(game, format: :json)
