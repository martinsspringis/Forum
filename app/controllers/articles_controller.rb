class ArticlesController < ApplicationController
  helper FormattingHelper
  helper RepliesHelper

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@replies = @article.replies
		@reply = @article.replies.build

	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params)

		if user_signed_in?
		  @article.user = current_user
      @article.author = current_user.nickname
    end

		if @article.save
			redirect_to @article
		else render :new
		end
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else 
			render :edit
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path
	end

	private
		
	def article_params
		params.require(:article).permit(:author, :title, :content)
	end

end
