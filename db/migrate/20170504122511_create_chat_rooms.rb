class CreateChatRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_rooms do |t|
      t.references :chat_initiator, foreign_key: { to_table: :users }
      t.references :chat_receiver, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
