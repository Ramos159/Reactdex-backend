class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.user :references
      t.integer :pokemon_1_id
      t.integer :pokemon_2_id
      t.integer :pokemon_3_id
      t.integer :pokemon_id_3
      t.integer :pokemon_4_id
      t.integer :pokemon_5_id
      t.integer :pokemon_6_id

      t.timestamps
    end
  end
end
