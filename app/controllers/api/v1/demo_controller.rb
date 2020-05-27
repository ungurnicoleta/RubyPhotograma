module Api
  module V1
    class DemoController < :: Api::V1::ApplicationController
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


      def get_photographers_for_city
        photographers = Photographer.all.where(city: params[:city])
        json_string = PhotographerSerializer.new(photographers).serializable_hash
        render json: {
            data: json_string
        }, status: 200
      end

      private

      def photographer_params
        params.permit(:description, :secondDescription, :rating, :price, :cameraDescription, :city)
      end

      end
  end
end
