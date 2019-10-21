class PresenceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "presence_list"
    puts "***|| #{current_user} CONNECTED TO STREAM_CHANNEL PRESENCE LIST ||****"
  end

  def unsubscribed
    current_session = Session.find_by(token: current_user)
    ActionCable.server.broadcast 'presence_list', {presence: false, username: current_session.username, token: current_session.token}
    reset_session
    Session.delete(current_session.id)

  end

  def get_in(data)
    current_session = Session.find_by(token: current_user)
    ActionCable.server.broadcast 'presence_list', {presence: true, username: current_session.username, token: current_session.token}
  end

end
