class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_chanel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
  	Message.create! content: data['message'], user_id: data['user_id']
  end
end
