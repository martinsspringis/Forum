class PlayerStat < ActiveRecord::Base
	belongs_to :player
	belongs_to :team
	belongs_to :game
end

# == Schema Information
#
# Table name: player_stats
#
#  id         :integer          not null, primary key
#  game_id    :integer
#  team_id    :integer
#  player_id  :integer
#  min        :time
#  fgm        :integer
#  fga        :integer
#  three_m    :integer
#  three_a    :integer
#  ftm        :integer
#  fta        :integer
#  eff_factor :integer
#  or         :integer
#  reb        :integer
#  ast        :integer
#  blk        :integer
#  stl        :integer
#  to         :integer
#  fouls      :integer
#  pts        :integer
#  created_at :datetime
#  updated_at :datetime
#
