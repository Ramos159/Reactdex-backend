class User < ApplicationRecord
  has_secure_password
  has_many :teams
  # accepts_nested_attributes_for :teams
end
