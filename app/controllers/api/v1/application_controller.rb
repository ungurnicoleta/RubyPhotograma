module Api
  module V1
    class ApplicationController < ::ApplicationController
      skip_before_action :verify_authenticity_token
      include DeviseTokenAuth::Concerns::SetUserByToken
      before_action :configure_permitted_parameters, if: :devise_controller?
      respond_to :json

      protected

      def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) << :username
        devise_parameter_sanitizer.for(:sign_up) << :name
        devise_parameter_sanitizer.for(:sign_up) << :phone
      end
    end
  end
end
