class Item < ApplicationRecord

  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :photos

  validates :name, presence: true
  validates :description, presence: true
  validates :state, presence: true
  validates :method, presence: true
  validates :region, presence: true
  validates :date, presence: true
  validates :price, presence: true
  
end
