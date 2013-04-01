class AddInteressesDescToProgramUsers < ActiveRecord::Migration
  
  def self.up
    add_column :program_users, :interesses_desc, :string
  end

  def self.down
    remove_column :program_users, :interesses_desc
  end
  
end
