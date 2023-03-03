# http://railscasts.com/episodes/219-active-model
# empty model, used for validation mainly
class Message
  include ActiveModel::Validations

  attr_accessor :email, :subject, :message

  validates :email, :subject, :message, presence: true
  validates :message, length: { maximum: 200 }
  validates :email, format: URI::MailTo::EMAIL_REGEXP
  validates :subject, format: { with: /\A[a-z A-Z0-9]+\z/ }

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
end
