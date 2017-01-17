class VideoPolicy < ApplicationPolicy
  def new?
    user && user.role >= 2
  end
end