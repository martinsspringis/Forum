class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.integer :team_id
    	t.date :date
    	t.string :at
    	t.integer :nyk_points
    	t.integer :opponent_points

    	t.timestamps
    end
  end
end
