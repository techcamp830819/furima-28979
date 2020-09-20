class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '半角英数字を入力' }
  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :birth_date
    validates :last_name
    validates :first_name
    validates :last_name_kana
    validates :first_name_kana
  end
  with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角（漢字・ひらがな・カタカナ）を入力' } do
    validates :last_name
    validates :first_name
  end
  with_options format: { with: /\A[ァ-ヶー－]+\z/, message: '全角（カタカナ）を入力' } do
    validates :last_name_kana
    validates :first_name_kana
  end
  with_options format: { with: /\A[ァ-ヶー－]+\z/, message: '全角（漢字・ひらがな）半角英数字入力NG' } do
    validates :last_name_kana
    validates :first_name_kana
  end
end
