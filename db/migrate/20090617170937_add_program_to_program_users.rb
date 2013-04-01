class AddProgramToProgramUsers < ActiveRecord::Migration
  
  def self.up
    add_column :program_users, :program, :string
  end

  def self.down
    remove_column :program_users, :program
  end
  
end
