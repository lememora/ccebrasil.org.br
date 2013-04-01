class AddOptionsToArticles < ActiveRecord::Migration
  
  def self.up
    add_column :articles, :bolsas_e_convocatorias, :boolean
  end

  def self.down
    remove_column :articles, :bolsas_e_convocatorias
  end
  
end
