

class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :followee_id
    end
  end
end


# 20200519220529_add_follow_counters_to_users.rb
#
# class AddFollowCountersToUsers < ActiveRecord::Migration[6.0]
#   def change
#     add_column :users, :followers_count, :integer, null: false, default: 0
#     add_column :users, :followees_count, :integer, null: false, default: 0
#   end
# end
