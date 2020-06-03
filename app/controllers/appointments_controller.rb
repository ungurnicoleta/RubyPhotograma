class AppointmentsController < InheritedResources::Base

  private

  def appointment_params
    params.require(:appointment).permit(:owner_id, :photographer_id, :starting_time, :ending_time, :appointment_status)
  end

end
