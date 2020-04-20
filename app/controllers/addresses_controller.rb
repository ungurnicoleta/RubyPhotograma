class AddressesController < InheritedResources::Base

  private

    def address_params
      params.require(:address).permit(:city, :region, :country, :zip)
    end

end
