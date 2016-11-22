class RepliesController < ApplicationController
	before_filter :load_article

	def create
		@reply = @article.replies.build(reply_params)

		if @reply.save
			redirect_to article_path(@article)
		else
			render "articles/show"
		end
	end

	private
		def reply_params
			params.require(:reply).permit(:author, :body)
		end

		def load_article
			@article = Article.find(params[:article_id])
		end

end