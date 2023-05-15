class CreateChatrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :chatrooms, id: :uuid do |t|
      t.string :title
      t.string :avatar
      t.boolean :group, default: false
      t.integer :creator_id

      t.timestamps
    end
  end
end
