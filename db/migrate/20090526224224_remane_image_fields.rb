class RemaneImageFields < ActiveRecord::Migration
  
  def self.up
    rename_column :programs, :image_file_name, :program_image_file_name
    rename_column :programs, :image_content_type, :iprogram_mage_content_type
    rename_column :programs, :image_file_size, :program_image_file_size
    rename_column :articles, :image_file_name, :article_image_file_name
    rename_column :articles, :image_content_type, :article_image_content_type
    rename_column :articles, :image_file_size, :article_image_file_size
    rename_column :highlights, :image_file_name, :highlight_image_file_name
    rename_column :highlights, :image_content_type, :highlight_image_content_type
    rename_column :highlights, :image_file_size, :highlight_image_file_size
  end

  def self.down
    rename_column :programs, :program_image_file_name, :image_file_name
    rename_column :programs, :program_image_content_type, :image_content_type
    rename_column :programs, :program_image_file_size, :image_file_size
    rename_column :articles, :article_image_file_name, :image_file_name
    rename_column :articles, :article_image_content_type, :image_content_type
    rename_column :articles, :article_image_file_size, :image_file_size
    rename_column :highlights, :highlight_image_file_name, :image_file_name
    rename_column :highlights, :highlight_image_content_type, :image_content_type
    rename_column :highlights, :highlight_image_file_size, :image_file_size
  end
  
end
