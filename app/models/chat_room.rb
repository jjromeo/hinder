class ChatRoom < ApplicationRecord
  belongs_to :chat_initiator, class_name: 'User'
  belongs_to :chat_receiver, class_name: 'User'
end
