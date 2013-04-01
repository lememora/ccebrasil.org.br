class CreateLivingFileVideos < ActiveRecord::Migration
  def self.up
    create_table :living_file_videos do |t|
      t.references :living_file
      t.string :title
      t.integer :position
      t.text :embed

      t.timestamps
    end
  end

  def self.down
    drop_table :living_file_videos
  end
end
