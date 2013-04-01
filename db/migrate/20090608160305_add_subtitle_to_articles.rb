class AddSubtitleToArticles < ActiveRecord::Migration
  
  def self.up
    add_column :articles, :image_desc, :string
  end

  def self.down
    remove_column :image_desc, :subtitle
  end
  
end
