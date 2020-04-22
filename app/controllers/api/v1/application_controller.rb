module Api
  module V1
    class ApplicationController < ActionController::API

      # skip_before_action :verify_authenticity_token
      include DeviseTokenAuth::Concerns::SetUserByToken
      before_action :configure_permitted_parameters, if: :devise_controller?
      respond_to :json
      before_action :authenticate_user!
      def authenticated_route
        render json: { ™user: current_user }
      end
      end
    end
  end
