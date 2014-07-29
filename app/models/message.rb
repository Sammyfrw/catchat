class Message < ActiveRecord::Base
  validates :chatroom, presence: true

  belongs_to :chatroom
end
