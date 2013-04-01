class AddDateTimeToPrograms < ActiveRecord::Migration
  
  def self.up
    add_column :programs, :start_date, :datetime
    add_column :programs, :finish_date, :datetime
  end

  def self.down
    remove_column :programs, :start_date
    remove_column :programs, :finish_date
  end
  
end
