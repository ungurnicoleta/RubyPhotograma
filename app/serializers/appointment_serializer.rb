class AppointmentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :starting_time, :appointment_status, :photographer_id, :owner_id
  set_type :appointment
  set_id :id # optional
  belongs_to :user, foreign_key: 'owner_id', class_name: 'User'
  belongs_to :photographer
end
