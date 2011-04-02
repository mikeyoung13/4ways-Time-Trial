class AddElapsedToTrial < ActiveRecord::Migration
  def self.up
    add_column :trials, :elapsed, :decimal
  end

  def self.down
    remove_column :trials, :elapsed
  end
end
