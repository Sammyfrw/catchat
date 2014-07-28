class Chatroom < ActiveRecord::Base
  belongs_to :owner, class_name: "User"

  validates :name, presence: true
  validates :passkey, presence: true
end
