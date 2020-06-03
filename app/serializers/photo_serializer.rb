class PhotoSerializer
  include FastJsonapi::ObjectSerializer
  attributes :url, :photographer_id
  set_type :photo
  belongs_to :photographer
  has_many :tags

end
