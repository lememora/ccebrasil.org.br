class AddFinishDateToPrograms < ActiveRecord::Migration
  
  def self.up
    add_column :programs, :finish_day, :integer
    add_column :programs, :finish_month, :integer
    add_column :programs, :finish_year, :integer
  end

  def self.down
    remove_column :programs, :finish_day
    remove_column :programs, :finish_month
    remove_column :programs, :finish_year
  end
  
end
