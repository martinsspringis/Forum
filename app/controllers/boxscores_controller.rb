class BoxscoresController < ApplicationController
	def index
		
	end

	def new
    @game = Game.find(params[:game_id])
    authorize @game
	end
end