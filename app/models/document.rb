class Document < ApplicationRecord
  belongs_to :user
  validates :user_id, :file_name, :file_location, presence: true
  validates :file_name, uniqueness: { case_sensitive: false }
  validates :file_location, uniqueness: { case_sensitive: false }
end
