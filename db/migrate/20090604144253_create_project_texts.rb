class CreateProjectTexts < ActiveRecord::Migration
  def self.up
    create_table :project_texts do |t|
      t.references :project
      t.string :title
      t.integer :position
      t.string :prj_txt_file_name
      t.string :prj_txt_content_type
      t.integer :prj_txt_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :project_texts
  end
end
