class StatsController < ApplicationController
	helper StatsHelper

	def index
		@players = Player.all.where(team_id: 3)
	end
end