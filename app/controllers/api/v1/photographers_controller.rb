module Api
  module V1
    class PhotographersController < :: Api::V1::ApplicationController
      def index
        # @photographers = Photographer.all
        # render json: @photographers, status: :ok
        # photographers = Photographer.joins(:user).where(city: params[:city])
        my_photographers = Photographer.joins(:user).where(city: params[:city])
              render json: {
                  data: {
                      objects: my_photographers
                  }
              }, status: 200
      end

      #Show photographer details for the current user
      def show
        photographer = current_user.photographer
        render json:
             { message: 'SUCCESS',
              my_photographer: photographer }, status: :ok
      end

      def get_photographers_for_city
        photographers = Photographer.joins(:user).where(city: params[:city])
        render json: {
            data: {
                objects: photographers
            }
        }, status: 200
      end

      def create
        address = Address.find(1)
        photographer = Photographer.new(photographer_params)
        photographer.user_id = current_user.id
        photographer.address = address
        json_string = PhotographerSerializer.new(photographer).serialized_json
        if photographer.save
          render json: json_string, status: :ok
        else
          render json: { message: 'ERROR' }, status: :unprocessable_entity
        end
      end


      def destroy
        photographer = Photographer.find(params[:id])
        photographer.destroy
        render json: { message: 'SUCCESS',
                      data: photographer }, status: :ok
      end

      # PUT method for updating in database a photographer based on id
      def update
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
        params.permit(:description, :secondDescription, :cameraDescription, :rating, :price, :city)
      end
    end
  end
end
