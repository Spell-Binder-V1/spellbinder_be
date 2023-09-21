require "rails_helper"

RSpec.describe "Card Facade" do
  describe '#card_search' do
    it 'returns a card search', :vcr do 
      search_card = "Black Lotus"
      card_facade = CardFacade.new
      card = card_facade.receive_card_search(search_card)
      expect(card).to be_an(Array)
      expect(card[0]).to be_a(CardPoro)
      expect(card[0].artist).to be_a(String)
      expect(card[0].color_identity).to satisfy { |value| value.is_a?(Array) || value.nil? }
      expect(card[0].colors).to satisfy { |value| value.is_a?(Array) || value.nil? }
      expect(card[0].converted_mana_cost).to be_a(Float)
      expect(card[0].id).to be_a(Integer)
      expect(card[0].image_url).to be_a(String)
      expect(card[0].mana_cost).to be_a(String)
      expect(card[0].multiverseid).to be_a(String)
      expect(card[0].name).to be_a(String)
      expect(card[0].number).to be_a(String)
      expect(card[0].power).to satisfy { |value| value.is_a?(Array) || value.nil? }
      expect(card[0].rarity).to be_a(String)
      expect(card[0].rulings).to satisfy { |value| value.is_a?(Array) || value.nil? }
      expect(card[0].set).to be_a(String)
      expect(card[0].set_name).to be_a(String)
      expect(card[0].subtypes).to satisfy { |value| value.is_a?(Array) || value.nil? }
      expect(card[0].text).to be_a(String)
      expect(card[0].toughness).to satisfy { |value| value.is_a?(Array) || value.nil? }
      expect(card[0].type).to be_a(String)
      expect(card[0].types).to be_a(Array)
    end
  end

  describe '#receive_card_show', :vcr do
    it 'returns a card show' do
      show_card_id = 1
      card_facade = CardFacade.new.receive_card_show(show_card_id)

      expect(card_facade).to be_a(CardPoro)
      expect(card_facade.artist).to be_a(String)
      expect(card_facade.color_identity).to satisfy { |value| value.is_a?(Array) || value.nil? }
      expect(card_facade.colors).to satisfy { |value| value.is_a?(Array) || value.nil? }
      expect(card_facade.converted_mana_cost).to be_a(Float)
      expect(card_facade.id).to be_a(Integer)
      expect(card_facade.image_url).to be_a(String)
      expect(card_facade.mana_cost).to be_a(String)
      expect(card_facade.multiverseid).to be_a(String)
      expect(card_facade.name).to be_a(String)
      expect(card_facade.number).to be_a(String)
      expect(card_facade.power).to satisfy { |value| value.is_a?(Array) || value.nil? }
      expect(card_facade.rarity).to be_a(String)
      expect(card_facade.rulings).to satisfy { |value| value.is_a?(Array) || value.nil? }
      expect(card_facade.set).to be_a(String)
      expect(card_facade.set_name).to be_a(String)
      expect(card_facade.subtypes).to satisfy { |value| value.is_a?(Array) || value.nil? }
      expect(card_facade.text).to be_a(String)
      expect(card_facade.toughness).to satisfy { |value| value.is_a?(Array) || value.nil? }
      expect(card_facade.type).to be_a(String)
      expect(card_facade.types).to be_a(Array)
    end
  end

  # describe '#receive_random_card', :vcr do
  #   it 'returns a random card' do
  #     random_card = CardFacade.new.receive_random_card

      # expect(random_card).to be_a(CardPoro)
      # expect(random_card.artist).to be_a(String)
      # expect(random_card.color_identity).to satisfy { |value| value.is_a?(Array) || value.nil? }
      # expect(random_card.colors).to satisfy { |value| value.is_a?(Array) || value.nil? }
      # expect(random_card.converted_mana_cost).to be_a(Float)
      # expect(random_card.id).to be_a(Integer)
      # expect(random_card.image_url).to be_a(String)
      # expect(random_card.mana_cost).to be_a(String)
      # expect(random_card.multiverseid).to be_a(String)
      # expect(random_card.name).to be_a(String)
      # expect(random_card.number).to be_a(String)
      # expect(random_card.power).to satisfy { |value| value.is_a?(Array) || value.nil? }
      # expect(random_card.rarity).to be_a(String)
      # expect(random_card.rulings).to satisfy { |value| value.is_a?(Array) || value.nil? }
      # expect(random_card.set).to be_a(String)
      # expect(random_card.set_name).to be_a(String)
      # expect(random_card.subtypes).to satisfy { |value| value.is_a?(Array) || value.nil? }
      # expect(random_card.text).to be_a(String)
      # expect(random_card.toughness).to satisfy { |value| value.is_a?(Array) || value.nil? }
      # expect(random_card.type).to be_a(String)
      # expect(random_card.types).to satisfy { |value| value.is_a?(Array) || value.nil?}
  #   end
  # end
end

