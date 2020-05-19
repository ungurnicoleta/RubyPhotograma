class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :avatar, :string
    add_column :users, :phone, :string
    add_column :users, :provider, :string, :null => false, :default => "email"
    add_column :users, :uid, :string, :null => false, :default => ""
    add_column :users, :tokens, :json

    add_index :users, [:uid, :provider], unique: true
  end

end
