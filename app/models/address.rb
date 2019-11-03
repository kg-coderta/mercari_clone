class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  # validates :postal_code,   presence: true, format:{with: /\d{7}/}
  # validates :prefectures,   presence: true,
  # validates :city,          presence: true, 
  # validates :house_number,  presence: true, 
  # validates :building_name, 

end
