class User < ApplicationRecord
  has_secure_password
  has_many :teams
  validates_length_of :teams,maximum:3
end
