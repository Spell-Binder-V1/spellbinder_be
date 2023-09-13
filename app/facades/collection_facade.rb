class CollectionFacade
  def receive_collections
    collections = MagicService.get_collections
    collections[:sets].map.with_index(1) do |collection, i|
      Collection.new(collection, i)
    end
  end
end