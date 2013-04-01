class AddDateToProgram < ActiveRecord::Migration
  
  def self.up
    remove_column :programs, :position
    add_column :programs, :day, :integer
    add_column :programs, :month, :integer
    add_column :programs, :year, :integer
  end

  def self.down
    remove_column :programs, :day
    remove_column :programs, :month
    remove_column :programs, :year
    add_column :programs, :position, :integer
  end
  
end
