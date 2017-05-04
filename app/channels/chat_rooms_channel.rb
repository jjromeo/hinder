class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_rooms_#{params['chat_room_id']}_channel"
  end

  def send_message(data)
    Rails.logger.info "#{data.inspect}"
    current_user.messages.create!(content: data['message'], chat_room_id: data['chat_room_id'])
  end
end
