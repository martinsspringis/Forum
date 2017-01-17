class PlayersController < ApplicationController
  helper FormattingHelper
  helper StatsHelper	
	def index
		@players = Player.all
	end

	def show
		@player = Player.find(params[:id])
		@last_stats = @player.player_stats.reverse
	end

	def new
		@teams = Team.all
		@player = Player.new
		authorize @player
	end

  def edit
  	@teams = Team.all
  	@player = Player.find(params[:id])
  	authorize @player
  end

	def create
		@player = Player.new(player_params)

		if @player.save
			redirect_to @player
		else
			render :new
		end
	end

  def update 
    @player = Player.find(params[:id])
    if @player.update(player_params)
			redirect_to @player
		else 
			render :edit
		end
  end

	private

	def player_params
		params.require(:player).permit(:team_id, :first_name, :last_name, :number, :picture, 
			:from, :height, :weight, :born, :nba_debut, :bio, :position)
	end
end