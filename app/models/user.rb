class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  # omniauthのコールバック時に呼ばれるメソッド
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]

      user.save(validate: false)
    end
  end

  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_one :address, dependent: :destroy
  has_one :card, dependent: :destroy
  has_many :comments, dependent: :destroy 
  
  validates :nickname, presence: true, length: { maximum: 20 }
  # validates :email, uniqueness: true, format: { with: /\A[a-zA-Z]+\z/,
  # message: "英文字のみが使用できます" }
  validates :password, length: { minimum: 7 }
  validates :password_confirmation, presence: true, length: { minimum: 7 } 
end
