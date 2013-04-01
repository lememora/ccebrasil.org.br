class CreateProjectCategories < ActiveRecord::Migration
  def self.up
    create_table :project_categories do |t|
      t.string :title
      t.text :description
      t.string :permalink

      t.timestamps
    end
  end

  def self.down
    drop_table :project_categories
  end
end
