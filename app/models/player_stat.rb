class PlayerStat < ActiveRecord::Base
	belongs_to :player
	belongs_to :team
	belongs_to :game

	validates :fgm, numericality: {greater_than_or_equal_to: 0}
	validates :fga, numericality: {greater_than_or_equal_to: 0}
	validates :three_m, numericality: {greater_than_or_equal_to: 0}
	validates :three_a, numericality: {greater_than_or_equal_to: 0}
	validates :ftm, numericality: {greater_than_or_equal_to: 0}
	validates :fta, numericality: {greater_than_or_equal_to: 0}
	validates :or, numericality: {greater_than_or_equal_to: 0}
	validates :reb, numericality: {greater_than_or_equal_to: 0}
	validates :ast, numericality: {greater_than_or_equal_to: 0}
	validates :blk, numericality: {greater_than_or_equal_to: 0}
	validates :stl, numericality: {greater_than_or_equal_to: 0}
	validates :to, numericality: {greater_than_or_equal_to: 0}
	validates :fouls, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 6}
	validates :pts, numericality: {greater_than_or_equal_to: 0}
	validates :min, numericality: {greater_than_or_equal_to: 0}
	validates :sec, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 60}
	validates :eff_factor, presence: true

	def game_time
		"#{min}:#{sec}"
	end
end

# == Schema Information
#
# Table name: player_stats
#
#  id         :integer          not null, primary key
#  game_id    :integer
#  team_id    :integer
#  player_id  :integer
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
#  min        :integer
#  sec        :integer
#
