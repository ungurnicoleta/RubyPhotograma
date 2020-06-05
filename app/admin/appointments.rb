# frozen_string_literal: true
ActiveAdmin.register Appointment do
  permit_params :appointment_status, :starting_time, :owner_id, :photographer_id

end
