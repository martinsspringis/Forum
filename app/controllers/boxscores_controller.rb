class BoxscoresController < ApplicationController
	def index
		
	end

	def new
    @game = Game.find(params[:game_id])
    @nyk = Team.where(name: "New York Knicks")

    @nyk_players = Player.all.where(team_id: @nyk)
    @opponent_players = Player.all.where(team_id: @game.team)
    
    authorize @game
	end
end