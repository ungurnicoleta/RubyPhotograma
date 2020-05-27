
module Api
  module V1
    class PhotosController < :: Api::V1::ApplicationController

      def index
        photos = Photo.all
        render json: {
            data: {
                objects: photos
            }
        }, status: 200
      end


      def show
        photos = Photo.where(:photographer_id => params[:photographer_id])
        render json: {
            data: {
                objects: photos
            }
        }, status: 200
      end

      def create; end

      def get_photo_by_photographer
        photos = Photo.where(:photographer_id => params[:photographer_id])
        render json: {
            data: {
                objects: photos
            }
        }, status: 200
      end

    end
  end
end
