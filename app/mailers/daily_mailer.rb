class DailyMailer < ActionMailer::Base
	default from: 'myknicksapp.mailer@gmail.com'

	def summary_mail(user)
		@user = user

		@todays_article_count = Article.where("created_at >= ?", Time.zone.now.beginning_of_day).count
		@todays_replies_count = Reply.where("created_at >= ?", Time.zone.now.beginning_of_day).count
		@total_articles = Article.count
		@total_replies = Reply.count

		mail to: user.email, subject: "Daily summary"
	end
end