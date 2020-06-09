class LikeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :owner_id, :user_id
  set_type :like
  belongs_to :user, foreign_key: 'owner_id', class_name: 'User'
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'

  attribute :name do |object|
    object&.user&.name
  end

  attribute :avatar do |object|
    object&.user&.avatar
  end

  attribute :photographer do |object|
    Photographer.where(user_id: object&.user&.id)
  end
end
