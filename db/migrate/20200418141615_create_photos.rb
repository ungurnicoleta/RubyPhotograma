class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.integer :photographer_id
      t.text :url

      t.timestamps
    end
  end
end
