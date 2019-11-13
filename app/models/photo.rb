class Photo < ApplicationRecord
  belongs_to :item,optional: true
  mount_uploader :image, ImageUploader


  validates :image, presence: true
  # validates :item_id, presence: true

  def self.create_photos_by(photo_params)
      return false if photo_params[:image].nil?

      Photo.transaction do 
    
        photo_params[:image].each do |photo|
          new_photo = Photo.new(image: photo)
          return false unless new_photo.save!
        end
      end
    
      true
    end

end

  
