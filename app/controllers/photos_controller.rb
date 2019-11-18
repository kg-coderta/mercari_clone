class PhotosController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def photo_params
    params.require(:photo).premit(image: [])
  end

  def create
  @photo = Photo.new(photo_params)
  end


  def update
  end
end
