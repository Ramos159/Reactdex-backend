class Pokemon < ApplicationRecord
  belongs_to :pokedex
  has_many :team_pokemons
  has_many :teams, through: :team_pokemons
end
