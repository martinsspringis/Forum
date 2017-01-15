class ChangeDateToDatetimeInGames < ActiveRecord::Migration
  def up
  	remove_column :games, :date 
  	add_column :games, :date, :datetime
  end

  def down
  	remove_column :games, :date
  	add_column :games, :date, :date 
  end
end
