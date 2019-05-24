class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.references :pokedex, foreign_key: true
      t.string :name
      t.string :element
      t.integer :hp
      t.integer :attack
      t.integer :sp_attack
      t.integer :defense
      t.integer :sp_defense
      t.integer :speed
      t.integer :total
      t.string :sprite

      t.timestamps
    end
  end
end
