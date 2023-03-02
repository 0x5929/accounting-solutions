class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :documents, inverse_of: :user, dependent: nil
  validates :email, :password, presence: true
  validates :email, format: URI::MailTo::EMAIL_REGEXP
  validates :email, uniqueness: true
  
  # authenticate from devise
  def self.authenticate(email, password)
    user = User.find_for_authentication(email:)
    user&.valid_password?(password) ? user : nil
  end
end
