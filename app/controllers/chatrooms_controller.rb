class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
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
end
