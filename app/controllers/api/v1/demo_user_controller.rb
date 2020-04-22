module Api
  module V1
    class DemoUserController < :: Api::V1::ApplicationController
      def members_only
        render json: {
            data: {
                message: "Welcome #{current_user.email}",
                user: current_user
            }
        }, status: 200
      end
    end
  end
end
