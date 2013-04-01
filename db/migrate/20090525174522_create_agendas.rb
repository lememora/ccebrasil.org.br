class CreateAgendas < ActiveRecord::Migration
  def self.up
    create_table :agendas do |t|
      t.string :name
      t.string :title
      t.string :where
      t.string :when
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :agendas
  end
end
