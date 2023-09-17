class Api::V0::DecksController < ApplicationController
  before_action :logged_in?, only: [:create]

  def create
    user = User.find_by(id: session[:user_id])

    deck = user.decks.build(deck_params)
    if deck.save
      render json: deck, status: :created
    else 
      render json: deck.errors, status: :unprocessable_entity
    end
  end

  private
  def deck_params
    params.require(:deck).permit(:name)
  end
  # def index
  #   facade = DeckFacade.new
  #   decks = facade.receive_decks
  #   render json: DeckSerializer.new(decks)
  # end
end