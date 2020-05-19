class AddUserToPhotographer < ActiveRecord::Migration[6.0]
  def change
    add_reference :photographers, :user, null: false, foreign_key: true
  end
end
