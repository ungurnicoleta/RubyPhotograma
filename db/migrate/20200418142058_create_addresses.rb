class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :region
      t.string :country
      t.bigint :zip

      t.timestamps
    end
  end
end
