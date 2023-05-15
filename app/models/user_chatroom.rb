class UserChatroom < ApplicationRecord

  before_save :set_uuid_id

  belongs_to :user
  belongs_to :chatroom

end
