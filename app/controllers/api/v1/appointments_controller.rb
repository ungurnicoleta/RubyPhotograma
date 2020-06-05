

module Api
  module V1
    class AppointmentsController < :: Api::V1::ApplicationController

      def index
        appointments = Appointment.all
        render json: { data: { objects: appointments } }, status: 200
      end

      def show
        appointments = Appointment.where(owner_id: current_user.id)
        render json: { data: { objects: appointments } }, status: 200
      end

      def create
        appointment = Appointment.new(appointment_params)
        appointment.save
        render json: appointment, status: 200
      end

      private

      def appointment_params
        params.permit(:owner_id, :photographer_id, :starting_time, :appointment_status)
      end

    end
  end
end
