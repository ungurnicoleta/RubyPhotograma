module Api
  module V1
    class AddressesController < :: Api::V1::ApplicationController

      def index
        addresses = Address.all
        render json: {
            data: {
                objects: addresses
            }
        }, status: 200
      end


      def show
        if !params[:city]
          addresses = Address.all.distinct.pluck(:city)
          render json: {
              data: {
                  objects: addresses
              }
          }, status: 200
        else
          addresses = Address.where(city: params[:city])
          render json: {
              data: {
                  objects: addresses
              }
          }, status: 200

        end
      end

      def create
        address = Address.new(address_params)
        if address.save
          render json: address, status: :ok
        else
          render json: { message: 'ERROR' }, status: :unprocessable_entity
        end
      end

      def get_city
        address = Address.where(city: params[:city])
        render json: {
            data: {
                objects: address
            }
        }, status: 200
      end


      private

      def address_params
        params.permit(:city, :region, :country, :zip)
      end
    end
  end
end
