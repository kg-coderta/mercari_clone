class PhotosController < ApplicationController
  # params.require(:item).permit(:name,photos_attributes:[:image])
  # 5.times{@item.photos.build}
  # skip_before_action :verify_authenticity_token

  def new
  end

  def photo_params
    params.require(:photo).premit(image: [])
  end

  def create
  @photo = Photo.new(photo_params)

end
