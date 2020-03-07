class PhotoProject < ApplicationRecord
  belongs_to :user
  resourcify
  validates :title, :presence => true
end
