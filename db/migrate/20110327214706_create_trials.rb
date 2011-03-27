class CreateTrials < ActiveRecord::Migration
  def self.up
    create_table :trials do |t|
      t.integer :event_id
      t.integer :bib
      t.string :gender
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end

  def self.down
    drop_table :trials
  end
end
