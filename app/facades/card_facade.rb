class CardFacade
  def receive_random_card
    random_card = MagicService.get_random_card
    card_data = random_card[:cards]

    card_data.map.with_index(1) do |collection, i|
      Card.new(collection, i)
    end
  end

  def receive_show_card(card_id)
    show_card = MagicService.get_show_card(card_id)
    card_data = show_card[:card]
    Card.new(card_data, 1)
  end

  def receive_card_show(card_id)
    show_card = MagicService.get_card_show(card_id)
    if show_card.has_key?(:error)
      Error.new(show_card)
    else
      card_data = show_card[:card]
      Card.new(card_data, 1)
    end
  end

  def receive_card_search(card_name)
    search_card = MagicService.get_card_search(card_name)
    return unless search_card.values != []
      card_data = search_card[:cards]
      card_data.map.with_index(1) do |collection, i|
        Card.new(collection, i)
      end
  end
end
