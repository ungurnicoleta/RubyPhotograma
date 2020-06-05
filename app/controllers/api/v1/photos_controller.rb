
module Api
  module V1
    class PhotosController < :: Api::V1::ApplicationController

      def index
        photos = Photo.all
        render json: { data: { objects: photos } }, status: 200
      end

      def show
        photos = Photo.where(photographer_id: params[:photographer_id])
        render json: { data: { objects: photos } }, status: 200
      end

      def create
        photographer_id = current_user.photographer.id
        photo = Photo.new(photo_params)
        photo.photographer_id = photographer_id
        photo.save
        json_string = PhotoSerializer.new(photo).serialized_json
        render json: json_string, status: :ok
        # render json: { data: { objects: photo } }, status: 200

      end



      def get_photo_by_photographer
        photos = Photo.all.where(photographer_id: params[:photographer_id])
        json_string = PhotoSerializer.new(photos).serializable_hash
        render json: { data: json_string }, status: 200
      end

      private

      def photo_params
        params.permit(:url)
      end

    end
  end
end
