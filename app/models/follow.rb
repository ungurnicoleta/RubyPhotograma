class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: 'follower_id', class_name: 'User',
           counter_cache: :followees_count,
           inverse_of: :followee_follows
  belongs_to :followee, foreign_key: 'followee_id', class_name: 'User',
             counter_cache: :followers_count,
             inverse_of: :follower_follows

end
