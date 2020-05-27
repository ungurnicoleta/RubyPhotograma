class PhotographerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :description, :secondDescription, :rating, :price, :cameraDescription, :user_id, :city
  set_type :photographer  # optional
  set_id :user_id # optional
  belongs_to :user
  belongs_to :address
  has_many :photos
end
