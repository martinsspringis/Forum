class PlayerPolicy < ApplicationPolicy

	def new?
		user && user.role == 3
	end

  def edit?
    user && user.role == 3
  end

end