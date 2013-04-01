class FixSocialnetworkImageNames < ActiveRecord::Migration
  
  def self.up
    rename_column :socialnetwork_sites, :sn_icon_download_file_name, :sn_icon_file_name
    rename_column :programs, :iprogram_mage_content_type, :program_mage_icontent_type
  end

  def self.down
    rename_column :socialnetwork_sites, :sn_icon_file_name, :sn_icon_download_file_name
    rename_column :programs, :program_mage_icontent_type, :iprogram_mage_content_type
  end
  
end
