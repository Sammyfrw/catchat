class GuestSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def create
    session[:username] = params[:guest_session][:username]
    redirect_to root_path
  end

  def destroy
    session[:username] = nil
    redirect_to root_path
  end

  private
end
