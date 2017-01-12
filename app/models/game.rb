class Game < ActiveRecord::Base
	belongs_to :team

	has_many :player_stats
end

# == Schema Information
#
# Table name: games
#
#  id              :integer          not null, primary key
#  team_id         :integer
#  date            :date
#  at              :string
#  nyk_points      :integer
#  opponent_points :integer
#  created_at      :datetime
#  updated_at      :datetime
#
