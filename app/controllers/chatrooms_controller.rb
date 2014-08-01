class ChatroomsController < ApplicationController
  before_filter :require_user, only: [:new, :create]

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @messages = @chatroom.messages.order(created_at: :asc)
    @chatroom_memberships = get_chatroom_members
    subscribe_user_to_chatroom
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      redirect_to @chatroom
    else
      render :new
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :passkey).merge(owner_id: current_user.id)
  end

  def get_chatroom_members
    ChatroomMembership.where(chatroom_id: @chatroom.id)
  end

  def subscribe_user_to_chatroom
    ChatroomMembership.where(user_id: current_user.id).delete_all
    new_membership = @chatroom.subscribe(current_user)
    membership_content = render_to_string(get_chatroom_members)
    update_room_memberships(membership_content)
  end

  def update_room_memberships(content)
    Pusher[params[:id].to_s].
      trigger(
        "update-room-memberships",
        {content: content}
      )
  end
end
