class UpdatePressDocument < ActiveRecord::Migration
  
  def self.up
    rename_column :press_documents, :protected, :protected_file
  end

  def self.down
    rename_column :press_documents, :protected_file, :protected
  end
  
end
