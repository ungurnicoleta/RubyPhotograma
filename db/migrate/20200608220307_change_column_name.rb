class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :likes, :photographer_id, :owner_id
  end
end
