class ChatroomsController < ApplicationController
  before_filter :require_user, only: [:new, :create]

  def index
    @chatrooms = Chatroom.all
    @user = current_user
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @messages = @chatroom.messages.order(created_at: :asc)
    subscribe_user_to_chatroom || subscribe_guest_to_chatroom
    @chatroom_memberships = get_chatroom_users
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

  def destroy
    chatroom = Chatroom.find(params[:id])
    if chatroom.owner_id == current_user.id
      chatroom.destroy
      redirect_to root_path
    end
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name, :passkey).merge(owner_id: current_user.id)
  end

  def get_chatroom_users
    ChatroomMembership.where(chatroom_id: @chatroom.id)
  end

  def subscribe_user_to_chatroom
    ChatroomMembership.where(user_id: current_user.id).delete_all
    @chatroom.subscribe(current_user)
    users = render_to_string(get_chatroom_users)
    update_room_memberships(users)
  end

  def subscribe_guest_to_chatroom
    guests = render_to_string(session[:username])
    update_room_memberships(guests)
  end

  def update_room_memberships(content)
    Pusher[params[:id].to_s].
      trigger(
        "update-#{content}",
        {content: content}
      )
  end
end
