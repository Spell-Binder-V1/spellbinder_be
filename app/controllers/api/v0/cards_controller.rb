class Api::V0::CardsController < ApplicationController
  def random
    facade = CardFacade.new
    card = facade.receive_random_card
    render json: CardSerializer.new(card)
  end

  def show
    card_id = params[:id]
    facade = CardFacade.new
    card = facade.receive_show_card(card_id)
    render json: CardSerializer.new(card)
  end
end