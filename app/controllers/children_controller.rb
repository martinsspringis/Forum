class ChildrenController < ApplicationController
  #before_filter :load_parent

  def new
   # @article = Article.find(params[:article_id])
   # @reply = @article.replies.find(params[:reply_id])
   # @child = @reply.children.build
  end

  #def create
  #  @child = @article.replies.build(reply_params)
  # @child.parent = @reply.id
#
#    if user_signed_in?
#		  @child.user = current_user
#		  @child.author = current_user.nickname
#	  end
#
#		if @child.save
#			redirect_to article_path(@article)
#		else
#			render "articles/show"
#		end
# end
#
#  private
#    def load_parent
#      @reply = Reply.find(params[:reply_id])
#      @article = Article.find(params[:article_id])
#    end

#   def reply_params
#			params.require(:reply).permit(:author, :body)
#		end
end