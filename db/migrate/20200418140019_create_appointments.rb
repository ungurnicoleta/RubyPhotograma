class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.integer :owner_id
      t.integer :photographer_id
      t.datetime :starting_time
      t.datetime :ending_time
      t.string :appointment_status

      t.timestamps
    end
  end
end
