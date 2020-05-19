class PhotoTagsController < InheritedResources::Base

  private

    def photo_tag_params
      params.require(:photo_tag).permit(:photo_id, :tag_id)
    end

end
