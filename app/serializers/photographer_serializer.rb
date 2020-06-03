class PhotographerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :description, :secondDescription, :rating, :price, :cameraDescription, :user_id, :city
  set_type :photographer  # optional
  set_id :id # optional
  belongs_to :user
  belongs_to :address
  has_many :photos

  attribute :name do |object|
    object&.user&.name
  end
  attribute :avatar do |object|
    object&.user&.avatar
  end

  attribute :email do |object|
    object&.user&.email
  end

  attribute :phone do |object|
    object&.user&.phone
  end

  attribute :region do |object|
    object&.address&.region
  end

  attribute :country do |object|
    object&.address&.country
  end

  attribute :city_adr do |object|
    object&.address&.city
  end

  attribute :zip do |object|
    object&.address&.zip
  end

  attribute :latitude do |object|
    object&.address&.latitude
  end

  attribute :longitude do |object|
    object&.address&.longitude
  end

end
