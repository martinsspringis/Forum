class TrollBlocker
  def initialize(user)
  	@user = user
  end

  def check_and_proceed
  	if @user.warnings >= 5
  		@user.blocked = true
  		@user.save
      redirect_to destory_user_session_path
      puts "success"
    end
  end
end