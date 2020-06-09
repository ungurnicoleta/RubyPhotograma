module Api
  module V1
    class AppointmentsController < :: Api::V1::ApplicationController

      def index
        appointments = Appointment.where(photographer_id: params[:photographer_id])
        json_string = AppointmentSerializer.new(appointments).serializable_hash
        render json: json_string, status: 200
      end

      def show
        appointments = Appointment.where(photographer_id: params[:photographer_id])
        json_string = AppointmentSerializer.new(appointments).serializable_hash
        render json: json_string, status: 200
      end

      def create
        appointment = Appointment.new(appointment_params)
        appointment.save
        json_string = AppointmentSerializer.new(appointment).serializable_hash
        render json: json_string, status: 200
      end

      private

      def appointment_params
        params.permit(:user_id, :photographer_id, :starting_time, :appointment_status)
      end

    end
  end
end
