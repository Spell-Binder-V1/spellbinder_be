require "rails_helper"

RSpec.describe "MagicService" do
  describe "#class methods" do
    describe "#get_collections" do
      it "can get all collections" do

        collection = MagicService.get_collections

        expect(collection).to be_an(Hash)
        expect(collection.first).to be_a(Array)
        expect(collection[:sets].first).to have_key(:name)
        expect(collection[:sets].first).to have_key(:code)
        expect(collection[:sets].first).to have_key(:type)
        expect(collection[:sets].first).to have_key(:releaseDate)
        expect(collection[:sets].first).to have_key(:block)
      end
    end

    describe "#get_collection_cards" do
      it "returns all cards for a specific collection" do
        collection_code = "arn"
        collection = MagicService.get_collection_cards(collection_code)


        expect(collection).to be_an(Hash)
        expect(collection.first).to be_a(Array)
        expect(collection[:cards].first).to have_key(:name)
        expect(collection[:cards].first).to have_key(:manaCost)
        expect(collection[:cards].first).to have_key(:cmc)
        expect(collection[:cards].first).to have_key(:colors)
        expect(collection[:cards].first).to have_key(:colorIdentity)
        expect(collection[:cards].first).to have_key(:type)
        expect(collection[:cards].first).to have_key(:types)
        expect(collection[:cards].first).to have_key(:subtypes)
        expect(collection[:cards].first).to have_key(:set)
        expect(collection[:cards].first).to have_key(:setName)
        expect(collection[:cards].first).to have_key(:text)
        expect(collection[:cards].first).to have_key(:artist)
        expect(collection[:cards].first).to have_key(:number)
        expect(collection[:cards].first).to have_key(:power)
        expect(collection[:cards].first).to have_key(:toughness)
        expect(collection[:cards].first).to have_key(:layout)
        expect(collection[:cards].first).to have_key(:multiverseid)
        expect(collection[:cards].first).to have_key(:imageUrl)
        expect(collection[:cards].first).to have_key(:printings)
        expect(collection[:cards].first).to have_key(:originalText)
        expect(collection[:cards].first).to have_key(:originalType)
        expect(collection[:cards].first).to have_key(:legalities)
        expect(collection[:cards].first).to have_key(:id)
      end
    end
  end
end