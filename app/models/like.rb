class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'owner_id', class_name: 'User'
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
end
