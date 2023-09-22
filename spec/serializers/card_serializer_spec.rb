require "rails_helper"

RSpec.describe CardSerializer, type: :serializer do
  it "serializes the expected attributes" do
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
    serializer = CardSerializer.new(card).to_json
    serialized_card = JSON.parse(serializer, symbolize_names: true)

    expect(serialized_card[:data]).to have_key(:id)
    expect(serialized_card[:data][:id]).to be_a(String)
    expect(serialized_card[:data]).to have_key(:type)
    expect(serialized_card[:data][:type]).to be_a(String)
    expect(serialized_card[:data]).to have_key(:attributes)
    expect(serialized_card[:data][:attributes]).to be_a(Hash)
    expect(serialized_card[:data][:attributes]).to have_key(:id)
    expect(serialized_card[:data][:attributes][:id]).to be_a(Integer)
    expect(serialized_card[:data][:attributes]).to have_key(:multiverseid)
    expect(serialized_card[:data][:attributes][:multiverseid]).to be_a(String)
    expect(serialized_card[:data][:attributes]).to have_key(:name)
    expect(serialized_card[:data][:attributes][:name]).to be_a(String)
    expect(serialized_card[:data][:attributes]).to have_key(:mana_cost)
    expect(serialized_card[:data][:attributes][:mana_cost]).to be_a(String)
    expect(serialized_card[:data][:attributes]).to have_key(:converted_mana_cost)
    expect(serialized_card[:data][:attributes][:converted_mana_cost]).to be_a(Float)
    expect(serialized_card[:data][:attributes]).to have_key(:colors)
    expect(serialized_card[:data][:attributes][:colors]).to be_a(Array)
    expect(serialized_card[:data][:attributes]).to have_key(:color_identity)
    expect(serialized_card[:data][:attributes][:color_identity]).to satisfy { |value| value.is_a?(Array) || value.nil? }
    expect(serialized_card[:data][:attributes]).to have_key(:type)
    expect(serialized_card[:data][:attributes][:type]).to be_a(String)
    expect(serialized_card[:data][:attributes]).to have_key(:types)
    expect(serialized_card[:data][:attributes][:types]).to be_a(Array)
    expect(serialized_card[:data][:attributes]).to have_key(:subtypes)
    expect(serialized_card[:data][:attributes][:subtypes]).to be_a(Array)
    expect(serialized_card[:data][:attributes]).to have_key(:rarity)
    expect(serialized_card[:data][:attributes][:rarity]).to be_a(String)
    expect(serialized_card[:data][:attributes]).to have_key(:set)
    expect(serialized_card[:data][:attributes][:set]).to be_a(String)
    expect(serialized_card[:data][:attributes]).to have_key(:text)
    expect(serialized_card[:data][:attributes][:text]).to be_a(String)
    expect(serialized_card[:data][:attributes]).to have_key(:artist)
    expect(serialized_card[:data][:attributes][:artist]).to be_a(String)
    expect(serialized_card[:data][:attributes]).to have_key(:number)
    expect(serialized_card[:data][:attributes][:number]).to be_a(String)
    expect(serialized_card[:data][:attributes]).to have_key(:power)
    expect(serialized_card[:data][:attributes][:power]).to satisfy { |value| value.is_a?(String) || value.nil? }
    expect(serialized_card[:data][:attributes]).to have_key(:toughness)
    expect(serialized_card[:data][:attributes][:toughness]).to satisfy { |value| value.is_a?(String) || value.nil? }
    expect(serialized_card[:data][:attributes]).to have_key(:image_url)
    expect(serialized_card[:data][:attributes][:image_url]).to be_a(String)
    expect(serialized_card[:data][:attributes]).to have_key(:rulings)
    expect(serialized_card[:data][:attributes][:rulings]).to be_a(Array)
  end
end