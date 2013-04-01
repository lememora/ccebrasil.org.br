class AddOpenToRegisterToPrograms < ActiveRecord::Migration
  
  def self.up
    add_column :programs, :open_to_register, :boolean
  end

  def self.down
    remove_column :programs, :open_to_register
  end

end
