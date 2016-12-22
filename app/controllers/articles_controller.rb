class ArticlesController < ApplicationController
  before_action :authenticate_user!, :only => [:new]
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
		authorize @article
	end

	def edit
		@article = Article.find(params[:id])
	  authorize @article
	end

	def create
		@article = Article.new(article_params)
		if user_signed_in?
		  @article.user = current_user
      if current_user.nickname
        @article.author = current_user.nickname
      else
      	@article.author = current_user.full_name
      end
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
		authorize @article
		@article.destroy

		redirect_to articles_path
	end

	private
		
	def article_params
		params.require(:article).permit(:author, :title, :content, :icon)
	end


end
