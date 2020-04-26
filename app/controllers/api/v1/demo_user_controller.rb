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
                :projects => photo_projects
            }
        }, status: 200
      end

      def all_users
        @users = User.select('*').all
        render json: @users.to_json
      end

      def photographers
        photographers = Role.find_by_name('PHOTOGRAPHER').users.all.where(id: current_user.id)
        render json: {
            data: {
                my_roles:
                    photographers
            }
        }, status: 200
      end

      # PUT method for updating in database a photographer based on user
      def my_photographer
        user = current_user
        photographer = user.photographer
        if photographer.update_attributes(photographer_params)
          render json: photographer, status: :ok
        else
          render json: { message: 'ERROR' }, status: :unprocessable_entity
        end
      end

      private

      def photographer_params
        params.permit(:description,:secondDescription, :rating, :price, :cameraDescription)
      end

      end
  end
end
