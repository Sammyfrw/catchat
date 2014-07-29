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
end
