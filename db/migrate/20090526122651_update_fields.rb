class UpdateFields < ActiveRecord::Migration
  
  def self.up
    remove_column :programs, :name
    add_column :programs, :permalink, :string
    add_column :highlights, :link_txt, :string
    remove_column :agendas, :name
    remove_column :articles, :name
    add_column :articles, :permalink, :string
  end

  def self.down
    add_column :programs, :name, :string
    remove_column :programs, :permalink
    remove_column :highlights, :link_txt
    add_column :agendas, :name, :string
    add_column :articles, :name, :string
    remove_column :articles, :permalink
  end
  
end
