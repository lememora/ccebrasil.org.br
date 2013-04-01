class AddUrlToAgenda < ActiveRecord::Migration
  
  def self.up
    add_column :agendas, :url, :string
  end

  def self.down
    remove_column :agendas, :url
  end
  
end
