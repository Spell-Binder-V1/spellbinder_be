require "rails_helper"

RSpec.describe "Collections Facade" do
  describe "#receive_collections" do
    it "receives collections" do
      collection_facade = CollectionFacade.new
      collections = collection_facade.receive_collections

      collections.each do |collection|

        expect(collection).to be_a(Collection)
        expect(collection.cards).to be_an(Array)
        expect(collection.code).to be_a(String)
        expect(collection.id).to be_a(Integer)
        expect(collection.name).to be_a(String)
        expect(collection.release_date).to be_a(String)
        expect(collection.type).to be_a(String)
      end

      expect(collections).to be_an(Array)
    end
  end

  describe "#receive_collection_cards" do
    it "receives a specific collection's cards" do
      collection_id = "arn"
      collection_facade = CollectionFacade.new
      collection = collection_facade.receive_collection_details(collection_id)

      collection.cards.each do |card|
        expect(card).to be_a(CardPoro)
      end

      test_card = collection.cards.first
      expect(test_card.artist).to be_a(String)
      expect(test_card.color_identity).to be_a(Array)
      expect(test_card.colors).to be_a(Array)
      expect(test_card.converted_mana_cost).to be_a(Float)
      expect(test_card.id).to be_a(Integer)
      expect(test_card.image_url).to be_a(String)
      expect(test_card.mana_cost).to be_a(String)
      expect(test_card.multiverseid).to be_a(String)
      expect(test_card.name).to be_a(String)
      expect(test_card.number).to be_a(String)
      expect(test_card.power).to be_a(String)
      expect(test_card.rarity).to be_a(String)
      expect(test_card.rulings).to eq(nil)
      expect(test_card.set).to be_a(String)
      expect(test_card.subtypes).to be_a(Array)
      expect(test_card.text).to be_a(String)
      expect(test_card.toughness).to be_a(String)
      expect(test_card.type).to be_a(String)
      expect(test_card.types).to be_a(Array)
    end
  end

  describe "#receive_collection_codes" do
    it "receives collection codes" do
      collection_facade = CollectionFacade.new.receive_collection_codes
      
      expect(collection_facade).to be_an(Array)
      expect(collection_facade[0].code).to be_a(String)
      expect(collection_facade[0].id).to be_a(Integer)
    end
  end
end