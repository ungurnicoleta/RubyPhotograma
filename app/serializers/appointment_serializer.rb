class AppointmentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :starting_time, :appointment_status, :photographer_id, :user_id
  set_type :appointment
  set_id :id # optional
  belongs_to :user
  belongs_to :photographer

  attribute :name do |object|
    object&.user&.name
  end

  attribute :phone do |object|
    object&.user&.phone
  end

end
