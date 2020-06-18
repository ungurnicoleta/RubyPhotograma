class HashtagSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :photographer_id, :style_id
  set_type :hashtag
  belongs_to :photographer
  belongs_to :style
  attribute :name do |object|
    object&.style&.name
  end
end
