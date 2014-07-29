class ChatroomsController < ApplicationController
  before_filter :require_user, only: [:new, :create]

  def index
    @chatrooms = Chatroom.all
  end

  def new
    if current_user.user?
      @chatroom = Chatroom.new
    else
      flash[:alert] = "Only registered cats can make new chatrooms!"
      redirect_to root_path
    end
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
