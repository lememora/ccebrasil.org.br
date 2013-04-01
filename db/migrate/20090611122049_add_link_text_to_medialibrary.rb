class AddLinkTextToMedialibrary < ActiveRecord::Migration
  
  def self.up
    add_column :medialibraries, :link_txt, :string
  end

  def self.down
    remove_column :medialibraries, :link_txt
  end
  
end
