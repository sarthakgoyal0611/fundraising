class User < ApplicationRecord
  has_many :events, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  mount_uploader :avatar, ProfileUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :dob, presence: true
       VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
       validates :email, presence: true, 
         uniqueness: { case_sensitive: false }, 
         length: { maximum: 105 },
         format: { with: VALID_EMAIL_REGEX }

         validate :pwd_lower_case, on: :create
         validate :pwd_upper_case, on: :create
         validate :pwd_special_char, on: :create
         validate :pwd_contains_num, on: :create
       
         def pwd_upper_case
           return if !!password.match(/\p{Upper}/)
           errors.add :password, ' must contain at least 1 uppercase charachter'
         end
       
         def pwd_lower_case
           return if !!password.match(/\p{Lower}/)
           errors.add :password, ' must contain at least 1 lowercase charachter'
         end
       
         def pwd_special_char
           special = "?<>',?[]}{=@-)(*&^%$#`~{}!"
           regex = /[#{special.gsub(/./){|char| "\\#{char}"}}]/
           return if password =~ regex
           errors.add :password, ' must contain special character'
         end
       
         def pwd_contains_num
           return if password.count("0-9") > 0
           errors.add :password, ' must contain at least one number'
         end
         
end
