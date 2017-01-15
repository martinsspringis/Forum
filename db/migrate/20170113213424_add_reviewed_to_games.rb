class AddReviewedToGames < ActiveRecord::Migration
  def up
  	add_column :games, :reviewed, :boolean, default: false
  end

  def down
		remove_column :games, :reviewed  	
  end
end
