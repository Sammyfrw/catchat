class ChatroomMembershipsController < ApplicationController
  def destroy
    @chatroom = Chatroom.find(params[:id])
    @subscriber = ChatroomMembership.find_by(user_id: current_user.id)
    @subscriber.unsubscribe
    membership_content = render_to_string(get_chatroom_members)
    update_room_memberships(membership_content)
    redirect_to root_path
  end

private

  def get_chatroom_members
    ChatroomMembership.where(chatroom_id: @chatroom.id)
  end

  def update_room_memberships(content)
    Pusher[params[:id].to_s].
      trigger(
        "update-room-memberships",
        {content: content}
      )
  end
end
