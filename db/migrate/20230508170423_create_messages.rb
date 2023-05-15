class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages, id: :uuid do |t|
      t.text :body
      t.integer :user_id
      t.string :chatroom_id

      t.timestamps
    end
  end
end
