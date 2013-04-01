class CreateDownloadFiles < ActiveRecord::Migration
  def self.up
    create_table :download_files do |t|
      t.string :title
      t.string :download_file_name
      t.string :download_content_type
      t.integer :download_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :download_files
  end
end
