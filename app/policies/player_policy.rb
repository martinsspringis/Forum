class PlayerPolicy < ApplicationPolicy

	def new?
		user && user.role >= 2
	end

  def edit?
    user && user.role >= 2
  end

end