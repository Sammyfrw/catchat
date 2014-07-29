class Guest
  def initialize(username)
    @username = username
  end

  def user?
    false
  end

  def name
    @username
  end
end
