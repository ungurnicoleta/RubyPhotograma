
module Api
  module V1
    class HashtagsController < :: Api::V1::ApplicationController

      def index
        hashtags = Hashtag.where(photographer_id: params[:photographer_id])
        json_string = HashtagSerializer.new(hashtags).serializable_hash
        render json: json_string, status: 200
      end

      def show
        hashtags = Hashtag.where(photographer_id: current_user.photographer.id)
        render json: { data: { objects: hashtags } }, status: 200
      end

      def get_hashtags_for_photographer
        hashtags = Hashtag.all.where(photographer_id: params[:photographer_id])
        json_string = HashtagSerializer.new(hashtags).serializable_hash
        render json: { data: json_string }, status: 200
      end

      def create
        photographer_id = current_user.photographer.id
        style_id = params[:style_id]
        hashtag = Hashtag.new
        hashtag.photographer_id = photographer_id
        hashtag.style_id = style_id
        hashtag.save
        json_string = HashtagSerializer.new(hashtag).serialized_json
        render json: json_string, status: :ok
      end

      private

      def hashtag_params
        params.permit(:id)
      end

    end
  end
end
