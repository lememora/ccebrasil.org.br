class AddTitleUrlToMediaLibrary < ActiveRecord::Migration
  
  def self.up
    add_column :medialibraries, :title, :string
  end

  def self.down
    remove_column :medialibraries, :title
  end
  
end
