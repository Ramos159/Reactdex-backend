class Pokemon < ApplicationRecord
  belongs_to :pokedex
  has_many :teams, through: :team_pokemons
end
