class AllowGuestsSignInConstraint
  def matches?(request)
    request.session[:username].present? || super
  end
end
