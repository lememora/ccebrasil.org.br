class CreateHighlights < ActiveRecord::Migration
  def self.up
    create_table :highlights do |t|
      t.string :title
      t.string :subtitle
      t.string :url

      t.timestamps
    end
    Highlight.create(:title => "test", :subtitle => "test", :url => "http://domain.com")
  end

  def self.down
    drop_table :highlights
  end
end
