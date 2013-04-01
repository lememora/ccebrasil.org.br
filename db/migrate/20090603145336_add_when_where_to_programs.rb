class AddWhenWhereToPrograms < ActiveRecord::Migration
  
  def self.up
    add_column :programs, :where, :string
    add_column :programs, :when, :string
  end

  def self.down
    remove_column :programs, :where
    remove_column :programs, :when
  end
  
end
