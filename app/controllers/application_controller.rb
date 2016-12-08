class ApplicationController < ActionController::Base
  
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :nickname, :email, :password, :asset])
  end

	def user_not_authorized
    flash[:alert] = "You don't have permission to do that!"
    redirect_to root_path
  end
end
