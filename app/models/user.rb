class User < ApplicationRecord
  has_secure_password
  has_many :decks

  validates :username, uniqueness: true, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  
  def self.user_decks(id)
    User.joins(:decks).where(users: { id: id }).select('users.*, decks.*')
  end

  def user_show_deck(user_id, deck_id)
    User.joins(:decks).where(users: { id: user_id }, decks: { id: deck_id }).select('users.*, decks.*')
  end
end
