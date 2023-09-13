class CardFacade
  def receive_collection_cards(collection_id)
    collections = MagicService.get_collection_cards(collection_id)
    require 'pry'; binding.pry
    a = collections[:cards].map.with_index(1) do |collection, i|
      Card.new(collection, i)
    end
  end
end