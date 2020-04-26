class CreatePhotographers < ActiveRecord::Migration[6.0]
  def change
    create_table :photographers do |t|
      t.text :description
      t.text :secondDescription
      t.integer :rating
      t.decimal :price
      t.text :cameraDescription
      t.integer :address_id

      t.timestamps
    end
  end
end
