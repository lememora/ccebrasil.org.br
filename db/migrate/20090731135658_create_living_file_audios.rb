class CreateLivingFileAudios < ActiveRecord::Migration
  def self.up
    create_table :living_file_audios do |t|
      t.references :living_file
      t.string :title
      t.integer :position
      t.string :lf_audio_file_name
      t.string :lf_audio_content_type
      t.integer :lf_audio_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :living_file_audios
  end
end
