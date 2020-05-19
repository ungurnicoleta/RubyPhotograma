
module Api
  module V1
    class PhotoProjectsController < :: Api::V1::ApplicationController
      def index
        @photo_projects = PhotoProject.all
        render json: @photo_projects, status: :ok
      end
    end
  end
end
