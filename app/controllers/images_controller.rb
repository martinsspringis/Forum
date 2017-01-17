class ImagesController < ApplicationController 
  def new
  	@nyk = Team.where(name: "New York Knicks")
    @players = Player.all.where(team_id: @nyk)

  	@image = Image.new
  end

  def create
  	@image = Image.new(image_params)

  	if @image.save
  		redirect_to galleries_path
  	else render :new
  	end
  end

  private

  def image_params
  	params.require(:image).permit(:image, :player_id, :game_id)
  end
end