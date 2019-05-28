class User < ApplicationRecord
  has_secure_password
  has_many :teams, limit:5
  # accepts_nested_attributes_for :teams
end
