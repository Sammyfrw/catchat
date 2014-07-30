class MessagesController < ApplicationController
  def create
    @message = Message.create(message_params)
    message_content = render @message
    push_message(message_content)
  end

  private

  def message_params
    params.require(:message).permit(:body).
      merge(
      sender: current_user.username,
      chatroom_id: params[:chatroom_id]
    )
  end

  def push_message(content)
    Pusher[message_params[:chatroom_id].to_s].
      trigger(
        'new-message',
        {content: content}
      )
  end
end
