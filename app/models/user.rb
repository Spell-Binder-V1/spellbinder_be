class User < ApplicationRecord
  has_many :decks

  validates :username, uniqueness: true, presence: true
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password
  has_secure_password
end
