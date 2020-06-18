class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :owner_id, :user_id
  end
end
