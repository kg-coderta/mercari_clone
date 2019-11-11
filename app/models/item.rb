class Item < ApplicationRecord
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  belongs_to :category
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :state, presence: true
  validates :method, presence: true
  validates :region, presence: true
  validates :date, presence: true
  validates :price, presence: true

  mount_uploader :image, ImageUploader
end
