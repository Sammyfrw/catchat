class Message < ActiveRecord::Base
  validates :chatroom, presence: true, dependent: :destroy

  belongs_to :chatroom
end
