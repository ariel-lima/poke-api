class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :types
      t.string :image_url
      t.integer :api_id

      t.timestamps
    end
  end
end
