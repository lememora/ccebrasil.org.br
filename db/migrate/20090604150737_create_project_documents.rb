class CreateProjectDocuments < ActiveRecord::Migration
  def self.up
    create_table :project_documents do |t|
      t.references :project
      t.string :title
      t.integer :position
      t.string :prj_doc_file_name
      t.string :prj_doc_content_type
      t.integer :prj_doc_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :project_documents
  end
end
