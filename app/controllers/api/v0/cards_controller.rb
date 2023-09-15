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

  def search
    card = params[:q]
    facade = CardFacade.new
    card = facade.receive_card_search(card)
    if card.is_a?(Array) && !card.empty?
      render json: CardSerializer.new(card)
    elsif card.present? ? card.is_a?(Error) : card.empty?
      render json: ErrorSerializer.serialize(card), status: :not_found
    end
  end
  #  /// binding.pry
  #   /// if card.is_a?(Error)
  #    ///  render json: ErrorSerializer.serialize(card), status: :not_found
  #   /// else
  #   ///  render json: CardSerializer.new(card)
  #  /// end
  # /// end
end
