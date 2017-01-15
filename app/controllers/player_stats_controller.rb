class PlayerStatsController < ApplicationController
	before_filter :load_game

	def index
	end

	def new
    @players = @game.team.players
    @player_stat = PlayerStat.new
    authorize @player_stat
	end

	def create
		@player_stat = @game.player_stats.build(player_stat_params)

		if @player_stat.save
			redirect_to new_game_boxscore_path(@game)
		else render :new
		end
	end

	private

	def player_stat_params
		params.require(:player_stat).permit(:player_id, :min, :sec, :fgm, :fga, :three_m,
			:three_a, :ftm, :fta, :eff_factor, :or, :reb, :ast, :blk, :stl, :to, :fouls,
			:pts)
	end

	def load_game
    @game = Game.find(params[:game_id])
	end
end