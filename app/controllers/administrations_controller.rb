class AdministrationsController < ApplicationController
  require 'write_badword'

  def show
      badword = WriteBadword.new(params[:word])
      badword.write
  end

  def send_summary
  	DailyMailer.summary_mail(current_user).deliver_now
  	redirect_to administrations_url
  end

end