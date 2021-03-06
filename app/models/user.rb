class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :password_confirmation, :password, format: {with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }

  with_options presence: true do
    validates :nickname

    with_options format: { with: /\A[ぁ-んァ-ン一-龠々]+\z/ } do
      validates :family_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :family_name_kana
      validates :last_name_kana
    end
    validates :birth_day
  end
end
