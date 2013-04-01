class CreatePrograms < ActiveRecord::Migration
  def self.up
    create_table :programs do |t|
      t.string :name
      t.string :title
      t.string :subtitle
      t.string :where
      t.string :when
      t.text :extract
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :programs
  end
end
