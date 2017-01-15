class NewsArticlePolicy < ApplicationPolicy

  def edit?
    user and record.user == user
  end

	def new?
    user && user.role >= 2
	end

  def destroy?
    user && user.role >= 2
  end

end