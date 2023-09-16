class CollectionFacade

  def receive_collections
    collections = MagicService.get_collections
    collections[:sets].map.with_index(1) do |collection, i|
      Collection.new(collection, i)
    end
  end

  def receive_collection_details(collection_id)
    collection_details = MagicService.get_collection_details(collection_id)

    if collection_details.has_key?(:error)
      Error.new(collection_details)
    else
      collection_data = collection_details[:set]

      collection = Collection.new(collection_data, 1)

      collection_cards = MagicService.get_collection_cards(collection_id)
      card_data = collection_cards[:cards]

      cards = card_data.map.with_index(1) do |collection, i|
        CardPoro.new(collection, i)
      end

      cards.each do |card|
        collection.cards << card
      end
    end
    collection
  end

  # def receive_collection_cards(collection_id)
  #   collections = MagicService.get_collection_cards(collection_id)
  #   card_data = collections[:cards]

  #   card_data.map.with_index(1) do |collection, i|
  #     CardPoro.new(collection, i)
  #   end
  # end

  def receive_collection_codes
    collection_code = MagicService.get_collections
    collection_code[:sets].map.with_index(1) do |collection, i|
      CollectionCode.new(collection, i)
    end
  end

  def filter_codes
    collection_codes = self.receive_collection_codes.map { |c| c.code }
  end
end