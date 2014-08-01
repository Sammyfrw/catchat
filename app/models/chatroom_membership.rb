class ChatroomMembership < ActiveRecord::Base
  belongs_to :chatroom
  belongs_to :user

  def unsubscribe
    destroy
  end

  def user
    super || Guest.new(session[:username])
  end

end
