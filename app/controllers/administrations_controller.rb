class AdministrationsController < ApplicationController
  require 'write_badword'

  def index
      badword = WriteBadword.new(params[:word])
      badword.write
  end
end