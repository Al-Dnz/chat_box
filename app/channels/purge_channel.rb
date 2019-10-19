class PurgeChannel < ApplicationCable::Channel
  def subscribed
    stream_from "purge_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def purge(data)
    Post.destroy_all
    ActionCable.server.broadcast "purge_channel" , purger: "#{data['name']}"

  end
end
