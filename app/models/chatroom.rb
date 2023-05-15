class Chatroom < ApplicationRecord

  before_save :set_uuid_id

  has_many :user_chatrooms
  has_many :users, through: :user_chatrooms
  has_many :messages

  broadcasts_to :current_chat

  def current_chat
    self
  end

  # def messages
  #   self.messages.order(created_at: :asc)
  # end

end
