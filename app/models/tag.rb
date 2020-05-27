class Tag < ApplicationRecord
  has_and_belongs_to_many :photos, join_table: :photo_tags
end
