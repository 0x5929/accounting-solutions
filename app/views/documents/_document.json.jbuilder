json.extract! document, :id, :user_id, :file_name, :file_location, :created_at, :updated_at
json.url document_url(document, format: :json)
