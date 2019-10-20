class PresenceChannel < ApplicationCable::Channel
  def subscribed
    #stream_from "presence_list"
    puts "***|| #{current_user} CONNECTED TO STREAM_CHANNEL PRESENCE LIST ||****"
  end

  def unsubscribed
    current_session = Session.find_by(token: current_user)
    username = current_session.username
    ActionCable.server.broadcast 'presence_list', {presence: false, username: username, token: current_user }
    Session.delete(current_session.id)

  end

  def get_in(data)
    username = Session.find_by(token: current_user).username
    ActionCable.server.broadcast 'presence_list', {presence: true, username: username, token: current_user}
  end

end
