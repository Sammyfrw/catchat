class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :chatroom_memberships
  has_many :chatrooms, through: :chatroom_memberships

  def user?
    true
  end
end
