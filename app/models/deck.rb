class Deck < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true

  def remove_card(list, card )
    # require 'pry'; binding.pry
    deck = Deck.find_by(name: self.name)
    card_to_remove = deck.cards[list][0]
    hash_to_remove = card_to_remove[0]
    if card_to_remove[0]['name'] == card 
      # deck.cards[list].delete(card_to_remove)
    
      card_to_remove.delete(hash_to_remove)
      deck.save
    end
  end
end
