class ApplicationController < ActionController::Base
  include Monban::ControllerHelpers
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :require_login

  def signed_in?
    session[:username].present? || super
  end

  def current_user
    super || Guest.new(session[:username])
  end

  private

  def require_user
    if !current_user.user?
      flash[:alert] = "You don't have permission to access the page as a guest."
      redirect_to root_path
    end
  end

  def require_signed_out
    if signed_in?
      flash[:alert] = "You're already signed in!"
      redirect_to root_path
    end
  end
end
