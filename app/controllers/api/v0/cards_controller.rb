class Api::V0::CardsController < ApplicationController
  def random
    facade = CardFacade.new
    card = facade.receive_random_card
    render json: CardSerializer.new(card)
  end

  def show
    card_id = params[:id]
    facade = CardFacade.new
    card = facade.receive_card_show(card_id)
    if card.is_a?(Error)
      render json: ErrorSerializer.serialize(card), status: :not_found
    else
      render json: CardSerializer.new(card)
    end
  end
end
