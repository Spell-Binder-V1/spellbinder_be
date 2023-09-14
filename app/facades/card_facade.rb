class CardFacade
  def receive_random_card
    random_card = MagicService.get_random_card
    card_data = random_card[:cards]

    card_data.map.with_index(1) do |collection, i|
      Card.new(collection, i)
    end
  end

  # def receive_show_card(card_id)
  #   show_card = MagicService.get_show_card(card_id)
  #   card_data = show_card[:card].have_key.values
  #   card_data.map.with_index(1) do |collection, i|
  #     Card.new(collection, i)
  #   end
  # end
end