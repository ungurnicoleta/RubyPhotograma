class Photographer < ApplicationRecord
  rolify
  belongs_to :user
  belongs_to :address
  has_many :photos
  has_many :appointments
  has_many :hashtags
  has_many :styles, through: :hashtags
  accepts_nested_attributes_for :hashtags, allow_destroy: true
end
