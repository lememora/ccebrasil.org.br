class AddPositionToAgenda < ActiveRecord::Migration
  
  def self.up
     add_column :agendas, :position, :integer
   end

   def self.down
     remove_column :agendas, :position
   end
  
end
