class Message < ApplicationRecord

  attr_accessor :created_by_current_user
  before_save :set_uuid_id

  belongs_to :chatroom
  has_one :user

  after_create_commit -> { broadcast_append_to chatroom, target: "chatroom_messages_#{self.chatroom_id}" }

end
