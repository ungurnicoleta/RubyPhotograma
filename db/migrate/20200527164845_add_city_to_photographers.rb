class AddCityToPhotographers < ActiveRecord::Migration[6.0]
  def change
    add_column :photographers, :city, :string
  end
end
