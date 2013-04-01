class CreateLivingFileDocuments < ActiveRecord::Migration
  def self.up
    create_table :living_file_documents do |t|
      t.references :living_file
      t.string :title
      t.integer :position
      t.string :lf_doc_file_name
      t.string :lf_doc_content_type
      t.integer :lf_doc_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :living_file_documents
  end
end
