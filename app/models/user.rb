class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  validates :email,              presence: true
  validates :password,           presence: true
  validates :password,           format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角英数字を入力' }
  validates :last_name,          format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角（漢字・ひらがな・カタカナ）を入力' }
  validates :first_name,         format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角（漢字・ひらがな・カタカナ）を入力' }
  validates :last_name_kana,     format: { with: /\A[ァ-ヶー－]+\z/, message: '全角（カタカナ）を入力' }
  validates :first_name_kana,    format: { with: /\A[ァ-ヶー－]+\z/, message: '全角（カタカナ）を入力' }
  validates :birth_date,         presence: true
end
