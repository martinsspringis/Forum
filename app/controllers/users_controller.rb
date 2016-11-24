class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
    	redirect_to edit_user_path, flash: {notice: "All changes have been saved!"}
    else
    	render edit_user_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :surname, :nickname, :asset)
    end

end
