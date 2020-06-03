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

      def user_photographer
        @user = current_user

        if @user.photographer.present?
          @photographer = @user.photographer
          @address = @user.photographer.address
          render json: {
              data: @user,
              my_address: @address,
              photographer: @photographer
          }, status: :ok
        else
          render json: {
              data: @user,
              my_address: [],
              photographer: []
          }, status: :ok
          end
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
