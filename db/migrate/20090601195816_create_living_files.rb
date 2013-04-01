class CreateLivingFiles < ActiveRecord::Migration
  def self.up
    create_table :living_files do |t|
      t.string :title
      t.text :description
      t.string :permalink
      t.integer :position
      t.string :living_file_file_name
      t.string :living_file_image_content_type
      t.integer :living_file_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :living_files
  end
end
