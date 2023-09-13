require "rails_helper"

RSpec.describe "Card Facade" do
  describe "#receive_collection_cards" do
    it "receives a specific collection's cards" do
      collection_id = "arn"
      card_facade = CardFacade.new
      collection_cards = card_facade.receive_collection_cards(collection_id)

      collection_cards.each do |card|
        expect(card).to be_a(Card)
      end

      test_card = collection_cards.first
      expect(test_card.artist).to eq("Ken Meyer, Jr.")
      expect(test_card.color_identity).to eq(["W"])
      expect(test_card.colors).to eq(["W"])
      expect(test_card.converted_mana_cost).to eq(1.0)
      expect(test_card.id).to eq(1)
      expect(test_card.image_url).to eq("http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=968&type=card")
      expect(test_card.mana_cost).to eq("{W}")
      expect(test_card.multiverseid).to eq("968")
      expect(test_card.name).to eq("Abu Ja'far")
      expect(test_card.number).to eq("1")
      expect(test_card.power).to eq("0")
      expect(test_card.rarity).to eq("Uncommon")
      expect(test_card.rulings).to eq(nil)
      expect(test_card.set).to eq("ARN")
      expect(test_card.subtypes).to eq(["Human"])
      expect(test_card.text).to eq("When Abu Ja'far dies, destroy all creatures blocking or blocked by it. They can't be regenerated.")
      expect(test_card.toughness).to eq("1")
      expect(test_card.type).to eq("Creature — Human")
      expect(test_card.types).to eq(["Creature"])
    end
  end
end