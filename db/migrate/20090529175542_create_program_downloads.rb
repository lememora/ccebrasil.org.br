class CreateProgramDownloads < ActiveRecord::Migration
  def self.up
    create_table :program_downloads do |t|
      t.integer :month
      t.integer :year
      t.string :program_download_file_name
      t.string :program_download_image_content_type
      t.integer :program_download_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :program_downloads
  end
end
