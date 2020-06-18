class CreateHashtags < ActiveRecord::Migration[6.0]
  def change
    create_table :hashtags do |t|
      t.belongs_to :photographer
      t.belongs_to :style
      t.timestamps
    end
  end
end
