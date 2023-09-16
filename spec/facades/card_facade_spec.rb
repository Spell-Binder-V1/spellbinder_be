require "rails_helper"

RSpec.describe "Card Facade" do
  describe '#card_search' do
    it 'returns a card search' do 
      search_card = "Black Lotus"
      card_facade = CardFacade.new
      card = card_facade.receive_card_search(search_card)
      expect(card).to be_an(Array)
      expect(card.count).to eq(13)
      expect(card.first).to be_a(CardPoro)
      expect(card.first.name).to eq("Black Lotus")
    end
  end
end
