class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.references :project_category
      t.string :title
      t.string :subtitle
      t.string :where
      t.string :when
      t.text :extract
      t.text :description
      t.string :permalink

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
