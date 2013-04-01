class AddCategoryToProgram < ActiveRecord::Migration
  
  def self.up
    add_column :programs, :program_category_id, :integer
  end

  def self.down
    remove_column :programs, :program_category
  end
  
end
