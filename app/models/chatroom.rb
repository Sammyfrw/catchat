class Chatroom < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  has_many :messages
  has_many :chatroom_memberships
  has_many :users, through: :chatroom_memberships

  validates :name, presence: true
  validates :passkey, presence: true

  def subscribe(user)
    chatroom_memberships.create(user_id: user.id)
  end
end
