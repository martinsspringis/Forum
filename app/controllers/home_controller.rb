class HomeController < ApplicationController
	helper FormattingHelper
  helper CalendarHelper

	def index
		@articles = NewsArticle.last(3).reverse
		@older_articles = NewsArticle.last(9).first(6)
		@upcoming_games = Game.where("date > ?", Time.now).order(date: :asc).first(3)
		@last_games = Game.where("date < ?", Time.now).order(date: :desc).first(3)
    @games = Game.all
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
	end
end