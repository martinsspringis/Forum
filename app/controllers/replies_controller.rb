class RepliesController < ApplicationController
	before_filter :load_article

  def new
    @reply = Reply.new(:parent_id => params[:parent_id])
    if request.xhr?
    	render "new"
    else
    	redirect_to new_article_reply_path(@article, :parent_id => params[:parent_id])
    end
  end

	def create
		@reply = @article.replies.build(reply_params)
		
    if current_user
		  @reply.user = current_user
		  @reply.author = current_user.nickname
	  end

		if @reply.save
			redirect_to article_path(@article)
		else
			render "articles/show"
		end
	end

	private

	def reply_params
		params.require(:reply).permit(:parent_id, :author, :content)
	end

	def load_article
		@article = Article.find(params[:article_id])
	end

end
