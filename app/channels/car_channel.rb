class CarChannel < ApplicationCable::Channel
  def subscribed
     stream_from "car_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end


  def receive (data)
    puts (data)
  end


end
