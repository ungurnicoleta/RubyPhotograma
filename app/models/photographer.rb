class Photographer < ApplicationRecord
  rolify
  belongs_to :user
  belongs_to :address
  has_many :photos
end
