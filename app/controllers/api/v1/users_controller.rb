
module Api
  module V1
    class UsersController < :: Api::V1::ApplicationController
      def index
        @users = User.all
      end

      #GET method to show photographer for a user
      def show
        user = User.find(params[:id])
        photographer = user.photographer
        render json: { message: 'SUCCESS',
                       my_photographer: photographer }, status: :ok
      end

      def edit
        @user = User.find(params[:id])
        @user.update(name: params[:users][:name], phone: params[:users][:phone])
      end

      def delete; end

      # PUT method for updating in database a user based on id
      def update
        user = User.find(params[:id])
        if user.update_attributes(user_params)
          render json: user, status: :ok
        else
          render json: { message: 'ERROR' }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.permit(:name, :username, :phone,:avatar)
      end

      def photographer_params
        params.permit(:description,:secondDescription, :rating, :price, :cameraDescription)
      end
    end
    end
  end
