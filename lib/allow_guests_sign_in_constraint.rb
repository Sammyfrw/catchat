class AllowGuestsSignInConstraint < Monban::Constraints::SignedIn
  def matches?(request)
    request.session[:username].present? || super
  end
end
