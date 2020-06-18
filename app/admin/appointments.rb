# frozen_string_literal: true

ActiveAdmin.register Appointment do
  permit_params :appointment_status, :starting_time, :user_id, :photographer_id

end
