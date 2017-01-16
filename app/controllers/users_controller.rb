class UsersController < ApplicationController

  def index
    @users = User.all
    authorize @users
  end

  def show
    @user = User.find(params[:id])
    @articles = @user.articles.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
    
    unless user_signed_in? and current_user.id == @user.id
      flash[:alert] = "You don't have permission to do that!"
      redirect_to root_path
    end
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
    authorize @user
    @user.blocked = true
    @user.save

    if current_user.role == 3
      redirect_to users_path
    else redirect_to user_path(@user)
    end
  end

  def unblock
    @user = User.find(params[:id])
    authorize @user
    @user.blocked = false
    @user.save

    if current_user.role == 3
      redirect_to users_path
    else redirect_to user_path(@user)
    end
  end

  def increase_role
    @user = User.find(params[:id])
    authorize @user
    
    @user.role += 1 if @user.role == 1
    @user.save

    redirect_to user_path(@user)
  end

  def decrease_role
    @user = User.find(params[:id])
    authorize @user

    @user.role -= 1 if @user.role == 2
    @user.save

    redirect_to user_path(@user)
  end

  private
    def user_params
      params.require(:user).permit(:name, :surname, :nickname, :asset)
    end

end
