class CreateLivingFileCategories < ActiveRecord::Migration
  def self.up
    create_table :living_file_categories do |t|
      t.string :category
      t.string :permalink

      t.timestamps
    end
  end

  def self.down
    drop_table :living_file_categories
  end
end
