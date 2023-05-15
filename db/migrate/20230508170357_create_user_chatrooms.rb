class CreateUserChatrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :user_chatrooms, id: :uuid do |t|
      t.integer :user_id
      t.string :chatroom_id

      t.timestamps
    end
  end
end
