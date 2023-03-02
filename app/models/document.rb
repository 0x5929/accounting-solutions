class Document < ApplicationRecord
  belongs_to :user
  validates_associated :user
  validates :user_id, :file_name, :file_location, presence: true

end
