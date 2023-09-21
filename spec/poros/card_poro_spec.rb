require "rails_helper"

RSpec.describe "Card PORO" do
  describe "#card" do
    it "has attributes" do
      card = CardPoro.new({ id: 1,
                            artist: "Christopher Moeller",
                            color_identity: ["B"],
                            colors: ["Black"],
                            cmc: 10.0,
                            imageUrl: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=382866&type=card",
                            manaCost: "{0}",
                            multiverseid: "382866",
                            name: "Black Lotus",
                            number: "1",
                            power: nil,
                            rarity: "Special",
                            rulings: [],
                            setName: "VMA",
                            set: "Vintage Masters",
                            subtypes: [],
                            text: "{T}, Sacrifice Black Lotus: Add three mana of any one color to your mana pool.",
                            toughness: nil,
                            type: "Artifact",
                            types: ["Artifact"]
                          }, 1)

      expect(card).to be_a(CardPoro)
      expect(card.artist).to be_a(String)
      expect(card.color_identity).to satisfy { |value| value.is_a?(Array) || value.nil? }
      expect(card.colors).to satisfy { |value| value.is_a?(Array) || value.nil? }
      expect(card.converted_mana_cost).to be_a(Float)
      expect(card.id).to be_a(Integer)
      expect(card.image_url).to be_a(String)
      expect(card.mana_cost).to be_a(String)
      expect(card.multiverseid).to be_a(String)
      expect(card.name).to be_a(String)
      expect(card.number).to be_a(String)
      expect(card.power).to satisfy { |value| value.is_a?(Array) || value.nil? }
      expect(card.rarity).to be_a(String)
      expect(card.rulings).to satisfy { |value| value.is_a?(Array) || value.nil? }
      expect(card.set).to be_a(String)
      expect(card.set_name).to be_a(String)
      expect(card.subtypes).to satisfy { |value| value.is_a?(Array) || value.nil? }
      expect(card.text).to be_a(String)
      expect(card.toughness).to satisfy { |value| value.is_a?(Array) || value.nil? }
      expect(card.type).to be_a(String)
      expect(card.types).to be_a(Array)
    end
  end
end