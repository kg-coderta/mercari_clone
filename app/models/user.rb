class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :items
  has_one  :address

  validates :nickname, presence: true
  validates :nickname, length: { maximum: 20 }
  validates :password, length: { minimum: 7 }
  validates :password_confirmation, presence: true, length: { minimum: 7 }
end
