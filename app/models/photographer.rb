class Photographer < ApplicationRecord
  rolify
  belongs_to :user
  belongs_to :address
  has_many :photos
  # has_many :appointments
  # has_many :users, through: :appointments
end
