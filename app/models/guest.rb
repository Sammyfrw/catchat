class Guest
  attr_reader :username

  def initialize(username)
    @username = username
  end

  def user?
    false
  end

  def id
    false
  end
end
