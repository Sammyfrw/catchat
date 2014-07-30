class ChatroomsController < ApplicationController
  before_filter :require_user, only: [:new, :create]

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @messages = @chatroom.messages.order(created_at: :desc)
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
