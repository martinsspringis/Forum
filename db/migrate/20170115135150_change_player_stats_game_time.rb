class ChangePlayerStatsGameTime < ActiveRecord::Migration
  def up
  	remove_column :player_stats, :min
  	add_column :player_stats, :min, :integer
  	add_column :player_stats, :sec, :integer
  end

  def down
  	remove_column :player_stats, :min 
  	remove_column :player_stats, :sec
  	add_column :player_stats, :min, :time
  end
end
