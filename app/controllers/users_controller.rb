class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to root_path
    else
      render "sessions/new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

