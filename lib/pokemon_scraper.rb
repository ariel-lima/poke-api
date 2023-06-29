require 'nokogiri'
require 'open-uri'

class PokemonScraper
  def self.fetch_pokemon_names
    url = 'https://bulbapedia.bulbagarden.net/wiki/List_of_Pok%C3%A9mon_by_National_Pok%C3%A9dex_number'
    doc = Nokogiri::HTML(URI.open(url))

    pokemon_names = doc.css('.mw-parser-output > table.sortable td:nth-child(4) > a').map(&:text)

    pokemon_names
  end
end
