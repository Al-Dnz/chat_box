class PurgeChannel < ApplicationCable::Channel
  def subscribed
    stream_from "purge_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def purge
    Post.destroy_all
    session = Session.find_by(token: current_user_token)
    ActionCable.server.broadcast "purge_channel" , purger: "#{session.username}"

  end
end
