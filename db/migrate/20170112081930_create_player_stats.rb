class CreatePlayerStats < ActiveRecord::Migration
  def change
    create_table :player_stats do |t|
    	t.integer :game_id
        t.integer :team_id
    	t.integer :player_id
    	t.time :min
    	t.integer :fgm #Field goals made
    	t.integer :fga #Field goals attempted
    	t.integer :three_m #3 pointers made
    	t.integer :three_a #3 pointers attempted
    	t.integer :ftm #Free throws made
    	t.integer :fta #Free throws attempted
    	t.integer :eff_factor #+/-
    	t.integer :or	#offensive rebounds
    	t.integer :reb #rebounds
    	t.integer :ast #assists
    	t.integer :blk #blocks
    	t.integer :stl #steals
    	t.integer :to #turnovers
    	t.integer :fouls #fouls
    	t.integer :pts #points

    	t.timestamps
    end
  end
end
