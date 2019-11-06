class Item < ApplicationRecord
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  has_many :photos
  has_many :comments

  validates :name, presence: true
  validates :description, presence: true
  validates :state, presence: true
  validates :method, presence: true
  validates :region, presence: true
  validates :date, presence: true
  validates :price, presence: true
end
