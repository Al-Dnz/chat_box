class PresenceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "presence_list"
    puts "***|| #{current_user} CONNECTED TO STREAM_CHANNEL PRESENCE LIST ||****"
  end

  def unsubscribed
    ActionCable.server.broadcast 'presence_list', {presence: false, username: current_user }


  end

  def get_in(data)
      ActionCable.server.broadcast 'presence_list', {presence: true, username: current_user}
  end

end
