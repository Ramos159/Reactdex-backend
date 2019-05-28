class Team < ApplicationRecord
belongs_to :user
has_many :team_pokemons, limit:6
has_many :pokemons, through: :team_pokemons
end
