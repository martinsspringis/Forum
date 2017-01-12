class HomeController < ApplicationController
	def index
		@articles = NewsArticle.all
	end
end