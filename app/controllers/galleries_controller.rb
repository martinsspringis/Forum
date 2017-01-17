class GalleriesController < ApplicationController
	def index
		@game_highlight_videos = Video.all.where(video_type: 1)
		@player_highlight_videos = Video.all.where(video_type: 2)
		@compilation_videos = Video.all.where(video_type: 3) 
		@images = Image.all
	end
end