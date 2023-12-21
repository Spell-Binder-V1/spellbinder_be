# class DeckFacade
#   attr_reader :deck

#   def initialize(deck)
#     @deck = deck
#   end

#   def add_card(list, card)
#     card_facade = CardFacade.new
#     card = card_facade.receive_card_search(card).take(1)
#     # TODO: only adds the first card returned from the search, but there are many cards with the same name
#     deck.cards[list] << card
#     deck.save
#   end

#   # def count_cards(list)
#   #   deck.cards[list].count
#   # end
# end