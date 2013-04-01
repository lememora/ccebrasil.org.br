class AddUrlToProgram < ActiveRecord::Migration
  
  def self.up
    add_column :programs, :url, :string
  end

  def self.down
    remove_column :programs, :url
  end
  
end
