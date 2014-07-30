require "monban/constraints/signed_in"

class AllowGuestsSignInConstraint
  def matches?(request)
    request.session[:username].present? || Monban::Constraints::SignedIn.new.matches?(request)
  end
end
