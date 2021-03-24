class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :encrypted_password, :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{7,}/}
        
  with_options presence: true do
    validates :nickname
    validates :family_name
    validates :last_name
    validates :family_name_kana
    validates :last_name_kana
    validates :birth_day
  end
end
