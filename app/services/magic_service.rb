class MagicService

  # def self.get_show_card(card_id)
  #   get_url("/v1/cards/#{card_id}")
  #   # response(data)
  # end

  # def self.response(data)
  #   data.first[0].map do |card_data|
  #     require 'pry'; binding.pry
  #     {
  #       "card": [{
  #         name: card_data[:name],
  #         "set_name" => card_data[:setName],
  #         "multiverseid" => card_data[:multiverseid],
  #         "mana_cost" => card_data[:manaCost],
  #         "converted_mana_cost" => card_data[:cmc],
  #         "colors" => card_data[:colors],
  #         "color_identity" => card_data[:colorIdentity],
  #         "type" => card_data[:type],
  #         "types" => card_data[:types],
  #         "subtypes" => card_data[:subtypes],
  #         "rarity" => card_data[:rarity],
  #         "set" => card_data[:set],
  #         "text" => card_data[:text],
  #         "artist" => card_data[:artist],
  #         "number" => card_data[:number],
  #         "power" => card_data[:power],
  #         "toughness" => card_data[:toughness],
  #         "image_url" => card_data[:imageUrl],
  #         "rulings" => card_data[:rulings]
  #       }]
  #     }
  #   end
  # end



  def self.get_random_card
    get_url("/v1/cards?random=true&pageSize=1")
  end

  def self.get_collection_cards(collection_code)
    get_url("/v1/cards?set=#{collection_code}")
  end

  def self.get_collections
    get_url("/v1/sets")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.magicthegathering.io" )
  end
end