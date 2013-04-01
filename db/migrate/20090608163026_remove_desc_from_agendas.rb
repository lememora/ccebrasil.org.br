class RemoveDescFromAgendas < ActiveRecord::Migration
  
  def self.up
    remove_column :agendas, :description
  end

  def self.down
    add_column :agendas, :description, :text
  end
  
end
