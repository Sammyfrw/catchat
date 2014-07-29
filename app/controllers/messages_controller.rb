class MessagesController < ApplicationController
  def create
    @message = Message.create(message_params)
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:body).
      merge(
      sender: current_user.username,
      chatroom_id: params[:chatroom_id]
    )
  end
end
