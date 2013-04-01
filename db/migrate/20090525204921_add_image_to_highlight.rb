class AddImageToHighlight < ActiveRecord::Migration
  
  def self.up
    add_column :highlights, :image_file_name, :string
    add_column :highlights, :image_content_type, :string
    add_column :highlights, :image_file_size, :integer
  end

  def self.down
    remove_column :highlights, :image_file_name
    remove_column :highlights, :image_content_type
    remove_column :highlights, :image_file_size
  end
  
end
