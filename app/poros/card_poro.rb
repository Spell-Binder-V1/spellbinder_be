class CardPoro
  attr_reader :id,
              :multiverseid,
              :name,
              :set_name,
              :mana_cost,
              :converted_mana_cost,
              :colors,
              :color_identity,
              :type,
              :types,
              :subtypes,
              :rarity,
              :set,
              :text,
              :artist,
              :number,
              :power,
              :toughness,
              :image_url,
              :rulings

  def initialize(attributes, id)
    @id = id
    @name = attributes[:name]
    @set_name = attributes[:setName]
    @multiverseid = attributes[:multiverseid]
    @mana_cost = attributes[:manaCost]
    @converted_mana_cost = attributes[:cmc]
    @colors = attributes[:colors]
    @color_identity = attributes[:colorIdentity]
    @type = attributes[:type]
    @types = attributes[:types]
    @subtypes = attributes[:subtypes]
    @rarity = attributes[:rarity]
    @set = attributes[:set]
    @text = attributes[:text]
    @artist = attributes[:artist]
    @number = attributes[:number]
    @power = attributes[:power]
    @toughness = attributes[:toughness]
    @image_url = attributes[:imageUrl]
    @rulings = attributes[:rulings]
  end
end