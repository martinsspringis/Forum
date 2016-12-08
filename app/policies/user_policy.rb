class UserPolicy < ApplicationPolicy
  def index?
    user and user.admin?	
  end

  def edit?
    user and record.user	
  end

  def block?
  	user and user.admin?
  end

  def unblock?
  	user and user.admin?
  end

end