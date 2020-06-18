module Api
  module V1
    class StylesController < :: Api::V1::ApplicationController

      def index
        styles = Style.all
        render json: { data: { objects: styles } }, status: 200
      end

      def show
        styles = Style.where(photographer_id: params[:photographer_id])
        render json: { data: { objects: styles } }, status: 200
      end

      def get_styles_for_photographer
        styles = Style.all.where(photographer_id: params[:photographer_id])
        json_string = StyleSerializer.new(styles).serializable_hash
        render json: { data: json_string }, status: 200
      end

      def create
        photographer_id = current_user.photographer.id
        style = Style.new(style_params)
        style.photographer_id = photographer_id
        photo.save
        json_string = PhotoSerializer.new(photo).serialized_json
        render json: json_string, status: :ok
        # render json: { data: { objects: photo } }, status: 200

      end

      private

      def style_params
        params.permit(:name)
      end

    end
  end
end
