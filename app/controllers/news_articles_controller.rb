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
		@article = NewsArticle.find(params[:id])
		authorize @article
	end

	def create 
		@article = NewsArticle.new(article_params)

    @article.user_id = current_user.id

		if @article.save
			redirect_to @article
		else render :new
		end
	end

	def update
		@article = NewsArticle.find(params[:id])
		if @article.update(article_params)
			redirect_to @article
		else 
			render :edit
		end
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