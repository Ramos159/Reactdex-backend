class TeamPokemonSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :team
  belongs_to :pokemon
end
