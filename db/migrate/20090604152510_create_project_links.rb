class CreateProjectLinks < ActiveRecord::Migration
  def self.up
    create_table :project_links do |t|
      t.references :project
      t.string :categ
      t.string :title
      t.string :url
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :project_links
  end
end
