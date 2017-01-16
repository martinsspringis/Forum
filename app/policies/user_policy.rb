class UserPolicy < ApplicationPolicy
  def index?
    user and user.role == 3	
  end

  def edit?
    user and record.role == 3	
  end

  def block?
  	user and user.role >= 2
  end

  def unblock?
  	user and user.role >= 2
  end

  def increase_role?
    user and user.role == 3
  end

  def decrease_role?
    user and user.role == 3
  end

end