class PhotosController < InheritedResources::Base

  private

    def photo_params
      params.require(:photo).permit(:photographer_id, :url)
    end

end
