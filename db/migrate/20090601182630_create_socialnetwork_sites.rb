class CreateSocialnetworkSites < ActiveRecord::Migration
  def self.up
    create_table :socialnetwork_sites do |t|
      t.string  :title
      t.string  :url
      t.integer :position
      t.string  :sn_icon_download_file_name
      t.string  :sn_icon_image_content_type
      t.integer :sn_icon_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :socialnetwork_sites
  end
end
