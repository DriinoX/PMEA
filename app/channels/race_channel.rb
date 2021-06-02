class RaceChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    race = Race.find(params[:id])
    stream_for race
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
