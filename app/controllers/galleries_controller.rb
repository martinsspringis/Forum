class GalleriesController < ApplicationController
	def index
		@game_highlight_videos = Video.all.where(video_type: 1).last(6).reverse
		@player_highlight_videos = Video.all.where(video_type: 2).last(6).reverse
		@compilation_videos = Video.all.where(video_type: 3) .last(6).reverse
		@images = Image.all.last(12).reverse
	end
end