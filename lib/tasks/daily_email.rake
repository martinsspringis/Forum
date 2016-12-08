desc 'send daily email'
task send_daily_email: :environment do
	@user = User.where(admin: true)
	@user.each do |u|
		DailyMailer.summary_mail(u).deliver_now
	end
end