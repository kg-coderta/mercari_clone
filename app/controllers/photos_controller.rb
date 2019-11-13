class PhotosController < ApplicationController

  def new
  end

  def photo_params
    params.require(:photo).premit(image: [])
  end

  def create
  @photo = Photo.new(photo_params)

end
