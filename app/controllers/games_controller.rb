class GamesController < ApplicationController
  helper FormattingHelper	

	def index
		@games = Game.all.where(hidden: false).where.not(nyk_points: nil).order(date: :desc)
	end

	def show
		@game = Game.find(params[:id])
	end

	def new
		@game = Game.new
		@teams = Team.where.not(id: 3)
		authorize @game
	end

	def edit
		@game = Game.find(params[:id])
		authorize @game
	end

	def create
		@game = Game.new(game_params)

		if @game.save
			redirect_to @game
		else render :new
		end
	end

	def update
		@game = Game.find(params[:id])
		if @game.update(game_params)
			redirect_to @game
		else render :edit
		end
	end

	def reviewed
		@game = Game.find(params[:id])
		authorize @game
		@game.reviewed = true;
		@game.save

		redirect_to game_path(@game)
	end

	private

	def game_params
		params.require(:game).permit(:team_id, :date, :at, :nyk_points,
		 :opponent_points, :hidden)
	end

end