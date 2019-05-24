class PokemonSerializer < ActiveModel::Serializer
  attribute :id
  attribute :element, key: :type
  attributes :name, :hp, :attack, :sp_attack, :defense, :sp_defense,:speed,:total,:sprite
end
