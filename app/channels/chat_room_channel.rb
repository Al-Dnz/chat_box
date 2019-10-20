class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    message_in_db = Post.create(user: current_user , content: data['message'])
    html = ApplicationController.render(partial: 'posts/message', locals:
      {message: message_in_db}
    )
    ActionCable.server.broadcast 'chat_channel', post: html
    #ActionCable.server.brodcast("chat_channel", {message: message})
  end

  def purge

  end

end
