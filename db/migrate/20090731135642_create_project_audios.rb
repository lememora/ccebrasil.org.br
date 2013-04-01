class CreateProjectAudios < ActiveRecord::Migration
  def self.up
    create_table :project_audios do |t|
      t.references :project
      t.string :title
      t.integer :position
      t.string :prj_audio_file_name
      t.string :prj_audio_content_type
      t.integer :prj_audio_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :project_audios
  end
end
