class CollectionFacade
  def receive_collections
    collections = MagicService.get_collections
    collections[:sets].map.with_index(1) do |collection, i|
      Collection.new(collection, i)
    end
  end

  def receive_collection_cards(collection_id)
    collections = MagicService.get_collection_cards(collection_id)
    card_data = collections[:cards]

    card_data.map.with_index(1) do |collection, i|
      Card.new(collection, i)
    end
  end

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