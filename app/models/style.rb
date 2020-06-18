class Style < ApplicationRecord
  has_many :hashtags
  has_many :photographers, through: :hashtags
  accepts_nested_attributes_for :hashtags, allow_destroy: true

end
