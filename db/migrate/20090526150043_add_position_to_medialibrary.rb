class AddPositionToMedialibrary < ActiveRecord::Migration
  
  def self.up
     add_column :medialibraries, :position, :integer
   end

   def self.down
     remove_column :medialibraries, :position
   end
  
end
