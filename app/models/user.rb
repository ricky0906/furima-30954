class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, length: {minimum: 6}, format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/} # 半角英数字混合での入力必須
  validates :email, uniqueness: true
  validates :nickname, presence: true, uniqueness: true
  validates :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/} # 全角での入力必須
  validates :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/} # 全角での入力必須
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/} # 全角カタカナでの入力必須
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/} # 全角カタカナでの入力必須
  validates :birthday, presence: true 
end
