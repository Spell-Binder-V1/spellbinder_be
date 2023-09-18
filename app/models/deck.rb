class Deck < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true

  # def remove_card(list, card )
  #   deck = Deck.find_by(name: self.name)
  #   card_to_remove = deck.cards[list][0].select { |hash| hash['name'] == card}
  #   hash_to_remove = card_to_remove[0]
  #   card_to_remove.delete(hash_to_remove)
  #   deck.save
  # end

  # def remove_card(list, card)
  #   # deck = Deck.find_by(name: self.name)
  #   card_to_remove = self.cards[list][0].select { |hash| hash['name'] == card}
  #   if card_to_remove != []
  #     hash_to_remove = card_to_remove[0]
  #     self.cards[list][0].delete(hash_to_remove)
  #     self.save
  #   end
  # end

  def remove_card(list, card)
    card_to_remove = self.cards[list][0].select { |hash| hash['name'] == card}
    return unless card_to_remove.any?
    card_to_remove.map do |hash|
      hash_to_remove = hash
      self.cards[list][0].delete(hash_to_remove) && self.cards[list].delete_if(&:empty?)
      self.save
    end
  end
end
