class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
    	redirect_to edit_user_path, flash: {notice: "All changes have been saved!"}
    else
    	render "users/edit"
    end
  end

  def block
    @user = User.find(params[:id])
    @user.blocked = true
    @user.save
    redirect_to users_path
  end

  def unblock
    @user = User.find(params[:id])
    @user.blocked = false
    @user.save
    redirect_to users_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :surname, :nickname, :asset)
    end

end
