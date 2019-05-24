class Pokedex < ApplicationRecord
  has_many :pokemon, -> {order(id: :asc)}
end
