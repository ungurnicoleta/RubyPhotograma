
module Api
  module V1
    class UsersController < :: Api::V1::ApplicationController
      def index
        @users = User.all
      end

      #GET method to show photographer for a user
      def show
        user = current_user
        if user.update(user_params)
          photographer = user.photographer
          address = user.photographer.address
          render json: {
              data: user,
              my_address: address,
              photographer: photographer
          }, status: :ok
        else
          render json: { message: 'ERROR' }, status: :unprocessable_entity
        end
      end


      def edit
        @user = User.find(params[:id])
        @user.update(name: params[:users][:name], phone: params[:users][:phone])
      end

      def delete; end

      # PUT method for updating in database a user based on id
      def update
        user = current_user
        if user.update(user_params)
          role = user.roles
          photographer = user.photographer
          render json: {
              data: user,
              my_roles: role,
              photographer: photographer
          }, status: :ok
        else

          render json: { message: 'ERROR' }, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.permit(:name, :phone, :avatar, :role_ids)
      end

      def photographer_params
        params.permit(:description, :secondDescription, :rating, :price, :cameraDescription)
      end
    end
    end
  end
