class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates_presence_of :content
  validates_length_of :content, maximum: 500
end
