class NewsArticlesController < ApplicationController
	def index
		@articles = NewsArticle.all
	end

	def show
		@article = NewsArticle.find(params[:id])
	end

	def new
		@article = NewsArticle.new
		authorize @article
	end

	def edit
	end

	def create 
		@article = NewsArticle.new(article_params)

		if @article.save
			redirect_to @article
		else render :new
		end
	end

	def update
	end

	def destroy
		@article = NewsArticle.find(params[:id])
		authorize @article
		@article.destroy

		redirect_to news_articles_path
	end

	private

	def article_params
		params.require(:news_article).permit(:title, :article, :image)
	end

end