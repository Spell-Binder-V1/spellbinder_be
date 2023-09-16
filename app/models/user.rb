class User < ApplicationRecord
  has_many :decks

  validates :username, uniqueness: true, presence: true
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password_digest, require: true
  # validates_presence_of :password_confirmation, require: true
  has_secure_password
end
