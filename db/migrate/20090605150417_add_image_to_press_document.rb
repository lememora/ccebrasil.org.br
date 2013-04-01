class AddImageToPressDocument < ActiveRecord::Migration
  
  def self.up
    add_column :press_documents, :presskit_thumb_file_name, :string
    add_column :press_documents, :presskit_thumb_content_type, :string
    add_column :press_documents, :presskit_thumb_file_size, :integer
  end

  def self.down
    remove_column :press_documents, :presskit_thumb_file_name
    remove_column :press_documents, :presskit_thumb_content_type
    remove_column :press_documents, :presskit_thumb_file_size
  end

end
