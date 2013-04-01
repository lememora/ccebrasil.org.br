class CreateProjectVideos < ActiveRecord::Migration
  def self.up
    create_table :project_videos do |t|
      t.references :project
      t.string :title
      t.integer :position
      t.text :embed

      t.timestamps
    end
  end

  def self.down
    drop_table :project_videos
  end
end
