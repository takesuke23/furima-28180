class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, presence: true
  # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, presence: true,  format: { with: VALID_PASSWORD_REGEX}
  validates :last_name, :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :kana_last, :kana_first, presence: true, format: { with: /\A[\p{katakana}ー－&&[^ -~｡-ﾟ]]+\z/ }
  validates :birthday, presence: true
end
