class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.integer :user_id
      t.string :file_name
      t.string :file_location

      t.timestamps
    end
    add_index :documents, :user_id
  end
end
