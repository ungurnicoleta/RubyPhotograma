class AddFieldnameToPhotoProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :photo_projects, :location, :string
    add_column :photo_projects, :date, :datetime
    add_column :photo_projects, :price, :decimal, precision: 5, scale: 2, default: 0.0
  end
end
