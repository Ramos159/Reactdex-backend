class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :pokemons
  belongs_to:user
  has_many :pokemons
end
