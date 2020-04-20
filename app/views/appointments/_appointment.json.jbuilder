json.extract! appointment, :id, :owner_id, :photographer_id, :starting_time, :ending_time, :appointment_status, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
