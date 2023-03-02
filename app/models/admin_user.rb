class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  validates :email, :password, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP
  validates :email, uniqueness: true
end
