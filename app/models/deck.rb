class Deck < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true


  def remove_card(list, card)
    # card_to_remove = self.cards[list][0].select { |hash| hash['name'] == card}
    # return unless card_to_remove.any?
    # card_to_remove.map do |hash|
    #   hash_to_remove = hash
    #   self.cards[list][0].delete(hash_to_remove) && self.cards[list].delete_if(&:empty?)
    #   self.save
    # end
    cards[list][0].reject! { |hash| hash['name'] == card } &&
    cards[list].delete_if(&:empty?) && save
  end
end
