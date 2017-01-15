class AdministrationsController < ApplicationController
  require 'write_badword'
  helper FormattingHelper

  def show  
    @games = Game.all.where("nyk_points is ? OR opponent_points is ?", nil, nil).where("date < ?", Time.now)
    unless user_signed_in? and current_user.role == 3
      flash[:alert] = "You don't have permission to do that!"
      redirect_to root_path
    end

    if (params[:word])
      badword = WriteBadword.new(params[:word])
      badword.write
    end
  end

  def send_summary
    unless user_signed_in? and current_user.role == 3
      flash[:alert] = "You don't have permission to do that!"
      redirect_to root_path
    end
  	
    DailyMailer.summary_mail(current_user).deliver_now
  	redirect_to administrations_url
  end

  def pending
    @pending_boxscores = Game.all.where(reviewed: false).where("date < ?", Time.now)
  end

end