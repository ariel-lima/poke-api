json.extract! pokemon, :id, :name, :types, :api_id, :created_at, :updated_at
json.url pokemon_url(pokemon, format: :json)
