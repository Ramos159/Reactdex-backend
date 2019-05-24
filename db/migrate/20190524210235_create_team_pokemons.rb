class CreateTeamPokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :team_pokemons do |t|
      t.references :team
      t.references :pokemon

      t.timestamps
    end
  end
end
