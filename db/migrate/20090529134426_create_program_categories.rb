class CreateProgramCategories < ActiveRecord::Migration
  def self.up
    create_table :program_categories do |t|
      t.string :category
      t.string :permalink

      t.timestamps
    end
  end

  def self.down
    drop_table :program_categories
  end
end
