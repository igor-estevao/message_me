class User < ApplicationRecord
  has_secure_password

  before_save { self.email = self.email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true
  validates :email, presence: true, length: { maximum: 105 },
                      uniqueness: { case_sensitive: false },
                      format: { with: VALID_EMAIL_REGEX }

  has_many :user_chatrooms
  has_many :chatrooms, through: :user_chatrooms
  has_many :messages

end
