class TeamPolicy < ApplicationPolicy

	def new?
		user && user.role == 3
	end

end