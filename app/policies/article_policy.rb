class ArticlePolicy < ApplicationPolicy
  
  def edit?
    user and record.user == user
  end

  def new?
    user
  end

  def destroy?
    user and user.admin?
  end
end