class ChatRoomsController < ApplicationController
  def create
    chat_receiver = Photo.find(params[:photo_id]).user
    chat_room = ChatRoom.new(chat_initiator: current_user, chat_receiver: chat_receiver)
    if chat_room.save
      render json: { chat_room_html: render_chat_room(chat_room) }
    end
  end

  private

  def render_chat_room(chat_room)
    render_to_string(partial: 'chat_room', locals: { chat_room: chat_room })
  end
end
