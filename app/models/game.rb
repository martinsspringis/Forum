class Game < ActiveRecord::Base
	belongs_to :team

	has_many :player_stats
	has_many :images

	validates :team_id, presence: true
	validates :at, presence: true  #ja nebūs izvēlēta spēles vieta, tad nedrīkstēs saglabāt
	validates :date, presence: true #Spēlei ir noteikti jābūt laikam

	def name
		if team.name.present? or date.present?
		  "vs #{team.name} #{date}"
		end
	end
end

# == Schema Information
#
# Table name: games
#
#  id              :integer          not null, primary key
#  team_id         :integer
#  at              :string
#  nyk_points      :integer
#  opponent_points :integer
#  created_at      :datetime
#  updated_at      :datetime
#  hidden          :boolean          default(FALSE)
#  reviewed        :boolean          default(FALSE)
#  date            :datetime
#
