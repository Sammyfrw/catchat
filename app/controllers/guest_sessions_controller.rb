class GuestSessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def create
    session[:username] = guest_params[:username]
    redirect_to root_path
  end

  def destroy
    session[:username] = nil
    redirect_to root_path
  end

  private

  def guest_params
    params.require(:guest_session).permit(:username)
  end
end
