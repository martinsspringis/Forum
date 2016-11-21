class AnswersController < ApplicationController
	before_filter :load_article

	def create
		@answer = @article.answers.build(answer_params)

		if @answer.save
			redirect_to article_path(@article)
		else
			render "articles/show"
		end
	end

	private
		def answer_params
			params.require(:answer).permit(:author, :body)
		end

		def load_article
			@article = Article.find(params[:article_id])
		end

end