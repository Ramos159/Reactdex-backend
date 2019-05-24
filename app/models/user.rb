class User < ApplicationRecord
  has_secure_password
  has_many :pokemons, through :teams
end
