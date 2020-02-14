class CreatePhotoProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :photo_projects do |t|
      t.string :title

      t.timestamps
    end
  end
end
