class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'include both letters and numbers'
  validates :password, length: { minimum: 6 }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'full-width characters' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'full-width katakana characters' } do
    validates :first_name_kana
    validates :last_name_kana
  end
  with_options presence: true do
    validates :birthday
    validates :nickname, uniqueness: true
  end

  has_many :items
  has_many :orders
end
