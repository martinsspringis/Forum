class TrollBlocker
  def initialize(user)
  	@user = user
  end

  def check_and_proceed
  	if @user.warnings >= 7
  		@user.blocked = true
  		@user.save
      puts "success"
    end
  end
end