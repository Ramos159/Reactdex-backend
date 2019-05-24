class Pokedex < ApplicationRecord
  has_many :pokemons, -> {order(id: :asc)}
end
