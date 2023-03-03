class AddDocumentColumnUniqueness < ActiveRecord::Migration[7.0]
  def change
    add_index :documents, :file_name, unique: true
    add_index :documents, :file_location, unique: true
  end
end
