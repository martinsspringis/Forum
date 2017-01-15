class GamePolicy < ApplicationPolicy
	def new?
    user && user.role >= 2
	end

	def edit?
		user && user.role >= 2
	end

	def destroy?
    user && user.role >= 2
	end

	def reviewed?
		user && user.role >= 2
	end
end