class PokedexSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :pokemons
end
