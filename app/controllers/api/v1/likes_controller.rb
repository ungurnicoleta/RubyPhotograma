module Api
  module V1
    class LikesController < :: Api::V1::ApplicationController

      def index
        likes = Like.where(owner_id: current_user.id)
        json_string = LikeSerializer.new(likes).serializable_hash
        render json: json_string, status: 200
      end

      def show
        likes = Like.where(owner_id: current_user.id)
        json_string = LikeSerializer.new(likes).serializable_hash
        render json: { data: { objects: likes } }, status: 200
      end


      def get_likes_for_user
        likes = Like.all.where(owner_id: current_user.id)
        json_string = LikeSerializer.new(likes).serializable_hash
        render json: { data: json_string }, status: 200
      end

      def create
        user_id = params[:user_id]
        like = Like.new
        like.user_id = user_id
        like.owner_id = current_user.id
        like.save
        json_string = LikeSerializer.new(like).serialized_json
        render json: json_string, status: :ok
      end

      def destroy
        like = Like.destroy(params[:id])
        json_string = LikeSerializer.new(like).serialized_json
        render json: json_string, status: :ok
      end

      private
      def like_params
        params.permit(:id)
      end

    end
  end
end
