module Api
  module V1
    class PhotographersController < :: Api::V1::ApplicationController

      def index
        @photographers = Photographer.all
        render json: @photographers, status: :ok
      end

      #Show photographer details for the current user
      def show
        photographer = current_user.photographer
        render json:
             { message: 'SUCCESS',
              my_photographer: photographer}, status: :ok
      end

      def create
        photographer = Photographer.new(photographer_params)
        if photographer.save
          render json: photographer, status: :ok
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
        params.permit(:description, :rating, :price)
      end
    end
  end
end
