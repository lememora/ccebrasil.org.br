class AddOneMoreFieldToMedialibraryUser < ActiveRecord::Migration
  
  def self.up    
    add_column :medialibrary_users, :atividades, :string
  end

  def self.down    
    remove_column :medialibrary_users, :atividades
  end
  
end
