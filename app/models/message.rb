class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates_presence_of :content
  validates_length_of :content, maximum: 500

  after_create_commit :broadcast_message

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end

  def broadcast_message
    ActionCable.server.broadcast "chat_rooms_#{chat_room_id}_channel",
                                  message: render_message(self)
  end

  def render_message(message)
    MessagesController.render partial: 'messages/message', locals: { message: message }
  end
end
