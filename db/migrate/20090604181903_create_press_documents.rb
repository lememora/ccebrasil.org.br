class CreatePressDocuments < ActiveRecord::Migration
  def self.up
    create_table :press_documents do |t|
      t.references :press_kit
      t.string :title
      t.integer :position
      t.boolean :protected
      t.string :presskit_file_name
      t.string :presskit_content_type
      t.integer :presskit_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :press_documents
  end
end
