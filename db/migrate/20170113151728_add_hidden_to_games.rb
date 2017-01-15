class AddHiddenToGames < ActiveRecord::Migration
  def up
  	add_column :games, :hidden, :boolean, default: false
  end

  def down
  	remove_column :games, :hidden
  end
end
