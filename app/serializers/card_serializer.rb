class CardSerializer
  include JSONAPI::Serializer
  attributes :id, :multiverseid, :name, :mana_cost, :converted_mana_cost, :colors, :color_identity, :type, :types, :subtypes, :rarity, :set, :text, :artist, :number, :power, :toughness, :image_url, :rulings
end
