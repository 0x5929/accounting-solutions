class Document < ApplicationRecord
  belongs_to :user
  validates_associated :user
  validates :user_id, :file_name, :file_location, presence: true
  # validates :file_name, uniqueness: true
  # validates :file_location, uniqueness: true
end
