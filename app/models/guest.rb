class Guest
  def initialize(username)
    @username = username
  end

  def user?
    false
  end

  def username
    @username
  end
end
