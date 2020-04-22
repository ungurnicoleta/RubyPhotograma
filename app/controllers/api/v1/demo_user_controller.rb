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

      def user_photo_projects
        photo_projects = PhotoProject.all.where(user_id: current_user.id)
        render json: {
            data: {
                projects:
                    photo_projects
            }
        }, status: 200
      end
    end
  end
end
