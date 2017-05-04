class ChatRoom < ApplicationRecord
  belongs_to :chat_initiator, class_name: 'User'
  belongs_to :chat_receiver, class_name: 'User'
  has_many :messages

  def other_user(user)
    user == chat_initiator ? chat_receiver : chat_initiator
  end
end
