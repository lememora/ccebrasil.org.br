class AddCategoryToLivingFiles < ActiveRecord::Migration
  
  def self.up
    add_column :living_files, :living_file_category_id, :int
  end

  def self.down
    remove_column :living_files, :living_file_category_id
  end
  
end
