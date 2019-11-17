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
  validates :email, presence: true, uniqueness: true, format:{ with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i } 
  validates :password, presence: true, length: { in: 7..128 }, confirmation:true, format:{ with: /\A[a-z\d]{7,128}+\z/i }
  validates :password_confirmation, presence: true, length: { in: 7..128 }, format:{ with: /\A[a-z\d]{7,128}+\z/i }
  validates :first_name, presence: true, length:{ maximum: 35 }
  validates :last_name, presence: true, length: {maximum:35 }
  validates :first_name_kana, presence: true, length:{ maximum: 35 }, format:{ with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/}
  validates :last_name_kana, presence: true, length:{ maximum: 35 }, format:{ with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/}
  validates :birth_year_id, presence: true
  validates :birth_month_id, presence: true
  validates :birth_day_id, presence: true
end
