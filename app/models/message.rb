class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates_presence_of :content
  validates_length_of :content, maximum: 500

  def timestamp
    created_at.strftime('%H:%M:%S %d %B %Y')
  end
end
