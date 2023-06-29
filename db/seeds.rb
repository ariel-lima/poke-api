require 'json'
require 'rest-client'

# Cleans all the pokemons from the database
Pokemon.destroy_all

def fetch_pokemon_data(url)
  response = RestClient.get(url)
  JSON.parse(response.body)
rescue RestClient::NotFound
  puts "Pokémon not found: #{url}"
  nil
end

def seed_pokemon(name)
  encoded_name = URI.encode_www_form_component(name)
  url = "https://pokeapi.co/api/v2/pokemon/#{encoded_name}/"
  data = fetch_pokemon_data(url)

  # Check if data is nil
  return if data.nil?

  types = data['types'].map { |type_data| type_data['type']['name'] }

  pokemon = Pokemon.new(
    name: data['name'],
    api_id: data['id'],
    image_url: data['sprites']['front_default'],
    types: types
  )
  pokemon.save!
end



# def seed_all_pokemons
#   pokemon_names = PokemonScraper.fetch_pokemon_names

#   pokemon_names.each do |name|
#     seed_pokemon(name)
#   end
# end

# all_pokemons = Pokemon.all
# Example usage:
# seed_pokemon('pikachu')
# seed_pokemon('bulbasaur')
# seed_pokemon('charmander')
# You can add more Pokémon names as needed
# Seed all Pokémon records


def seed_all_pokemons

  pokemon_list_capitalized = [
  'Bulbasaur', 'Ivysaur', 'Venusaur', 'Charmander', 'Charmeleon', 'Charizard', 'Squirtle', 'Wartortle',
  'Blastoise', 'Caterpie', 'Metapod', 'Butterfree', 'Weedle', 'Kakuna', 'Beedrill', 'Pidgey', 'Pidgeotto',
  'Pidgeot', 'Rattata', 'Raticate', 'Spearow', 'Fearow', 'Ekans', 'Arbok', 'Pikachu', 'Raichu', 'Sandshrew',
  'Sandslash', 'Nidoran-f', 'Nidorina', 'Nidoqueen', 'Nidoran-m', 'Nidorino', 'Nidoking', 'Clefairy', 'Clefable',
  'Vulpix', 'Ninetales', 'Jigglypuff', 'Wigglytuff', 'Zubat', 'Golbat', 'Oddish', 'Gloom', 'Vileplume',
  'Paras', 'Parasect', 'Venonat', 'Venomoth', 'Diglett', 'Dugtrio', 'Meowth', 'Persian', 'Psyduck', 'Golduck',
  'Mankey', 'Primeape', 'Growlithe', 'Arcanine', 'Poliwag', 'Poliwhirl', 'Poliwrath', 'Abra', 'Kadabra',
  'Alakazam', 'Machop', 'Machoke', 'Machamp', 'Bellsprout', 'Weepinbell', 'Victreebel', 'Tentacool',
  'Tentacruel', 'Geodude', 'Graveler', 'Golem', 'Ponyta', 'Rapidash', 'Slowpoke', 'Slowbro', 'Magnemite',
  'Magneton', "Farfetchd", 'Doduo', 'Dodrio', 'Seel', 'Dewgong', 'Grimer', 'Muk', 'Shellder', 'Cloyster',
  'Gastly', 'Haunter', 'Gengar', 'Onix', 'Drowzee', 'Hypno', 'Krabby', 'Kingler', 'Voltorb', 'Electrode',
  'Exeggcute', 'Exeggutor', 'Cubone', 'Marowak', 'Hitmonlee', 'Hitmonchan', 'Lickitung', 'Koffing', 'Weezing',
  'Rhyhorn', 'Rhydon', 'Chansey', 'Tangela', 'Kangaskhan', 'Horsea', 'Seadra', 'Goldeen', 'Seaking', 'Staryu',
  'Starmie', 'Mr-mime', 'Scyther', 'Jynx', 'Electabuzz', 'Magmar', 'Pinsir', 'Tauros', 'Magikarp', 'Gyarados',
  'Lapras', 'Ditto', 'Eevee', 'Vaporeon', 'Jolteon', 'Flareon', 'Porygon', 'Omanyte', 'Omastar', 'Kabuto',
  'Kabutops', 'Aerodactyl', 'Snorlax', 'Articuno', 'Zapdos', 'Moltres', 'Dratini', 'Dragonair', 'Dragonite',
  'Mewtwo', 'Mew']

  lowercase_array = pokemon_list_capitalized.map(&:downcase)

  lowercase_array.each do |pokemon_name|
    seed_pokemon(pokemon_name)
  end
end

def seed_all_pokemons2

  pokemon_list_capitalized = [
    'Chikorita', 'Bayleef', 'Meganium', 'Cyndaquil', 'Quilava', 'Typhlosion', 'Totodile', 'Croconaw',
    'Feraligatr', 'Sentret', 'Furret', 'Hoothoot', 'Noctowl', 'Ledyba', 'Ledian', 'Spinarak', 'Ariados',
    'Crobat', 'Chinchou', 'Lanturn', 'Pichu', 'Cleffa', 'Igglybuff', 'Togepi', 'Togetic', 'Natu', 'Xatu',
    'Mareep', 'Flaaffy', 'Ampharos', 'Bellossom', 'Marill', 'Azumarill', 'Sudowoodo', 'Politoed', 'Hoppip',
    'Skiploom', 'Jumpluff', 'Aipom', 'Sunkern', 'Sunflora', 'Yanma', 'Wooper', 'Quagsire', 'Espeon',
    'Umbreon', 'Murkrow', 'Slowking', 'Misdreavus', 'Unown', 'Wobbuffet', 'Girafarig', 'Pineco',
    'Forretress', 'Dunsparce', 'Gligar', 'Steelix', 'Snubbull', 'Granbull', 'Qwilfish', 'Scizor',
    'Shuckle', 'Heracross', 'Sneasel', 'Teddiursa', 'Ursaring', 'Slugma', 'Magcargo', 'Swinub', 'Piloswine',
    'Corsola', 'Remoraid', 'Octillery', 'Delibird', 'Mantine', 'Skarmory', 'Houndour', 'Houndoom',
    'Kingdra', 'Phanpy', 'Donphan', 'Porygon2', 'Stantler', 'Smeargle', 'Tyrogue', 'Hitmontop', 'Smoochum',
    'Elekid', 'Magby', 'Miltank', 'Blissey', 'Raikou', 'Entei', 'Suicune', 'Larvitar', 'Pupitar', 'Tyranitar',
    'Lugia', 'Ho-Oh', 'Celebi'
  ]

  lowercase_array = pokemon_list_capitalized.map(&:downcase)

  lowercase_array.each do |pokemon_name|
    seed_pokemon(pokemon_name)
  end
end
puts "Deleted all Pokémons!"
puts "Seeding Pokémon records..."
seed_all_pokemons
seed_all_pokemons2
puts "Seeding completed!"

# Fetch all Pokémon records from the database
all_pokemons = Pokemon.all.reload

# Iterate over the Pokémon records and print their details
# puts "Showing all Pokémon details:"
all_pokemons.each do |pokemon|
  puts "Created! #{pokemon.name}!"
  # puts "API ID: #{pokemon.api_id}"
  # puts "Image URL: #{pokemon.image_url}"
  puts "--------------------------"
end

puts "Created #{all_pokemons.count} pokemons!"


# Create User Profiles

ash = User.create(
  email: "ash@pokemon.com",
  password: "123456"
)

all_users = User.all
puts "Creating User Profiles..."
puts "Created #{all_users.count} users"
