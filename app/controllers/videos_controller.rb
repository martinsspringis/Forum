class VideosController < ApplicationController
  def new
  	@video = Video.new
  end

  def create
  	@video = Video.new(video_params)

  	if @video.save
  		redirect_to galleries_path
  	else render :new
  	end
  end

  private

  def video_params
  	params.require(:video).permit(:video_link, :video_type)
  end
end