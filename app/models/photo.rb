class Photo < ApplicationRecord
  has_and_belongs_to_many :tags, join_table: :photo_tags
  belongs_to :photographer
  mount_uploader :url, ImageUploader
end
