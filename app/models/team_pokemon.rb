class TeamPokemon < ApplicationRecord
  belongs_to :team
  belongs_to :pokemon
  # validates_associated :team
end
