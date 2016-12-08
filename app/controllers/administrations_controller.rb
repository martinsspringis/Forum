class AdministrationsController < ApplicationController
  require 'write_badword'

  def show  
    unless user_signed_in? and current_user.admin
      flash[:alert] = "You don't have permission to do that!"
      redirect_to root_path
    end

    if (params[:word])
      badword = WriteBadword.new(params[:word])
      badword.write
    end
  end

  def send_summary
    unless user_signed_in? and current_user.admin
      flash[:alert] = "You don't have permission to do that!"
      redirect_to root_path
    end
  	
    DailyMailer.summary_mail(current_user).deliver_now
  	redirect_to administrations_url
  end

end