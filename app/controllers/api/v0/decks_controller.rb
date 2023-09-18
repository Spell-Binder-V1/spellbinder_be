class Api::V0::DecksController < ApplicationController
<<<<<<< HEAD
  before_action :authenticate_user
  def index
    facade = DeckFacade.new
    decks = facade.receive_decks
    render json: DeckSerializer.new(decks)
  end

  def show
    deck_id = params[:id]
    facade = DeckFacade.new
    deck = facade.receive_deck_show(deck_id)
    if deck.is_a?(Error)
      render json: ErrorSerializer.serialize(deck), status: :not_found
    else
      render json: DeckSerializer.new(deck)
    end
  end
=======
  before_action :logged_in?
  
  def create
    user = User.find_by(id: session[:user_id])

    deck = user.decks.build(deck_params)
    if deck.save
      render json: deck, status: :created
    else 
      render json: deck.errors, status: :unprocessable_entity
    end
  end

  def add_card
    begin
      deck = Deck.find(params[:deck_id])
      facade = DeckFacade.new(deck)
      
      facade.add_card(params[:list], params[:card])
      render json: deck, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Deck not found" }, status: :not_found
    end
    # deck = Deck.find(params[:deck_id])
    # facade = DeckFacade.new(deck)
    # facade.add_card(params[:list], params[:card])
    # if deck.save
    #   render json: deck, status: :ok
    # else 
    #   render json: deck.errors, status: :not_found
    # end
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
>>>>>>> 8c6b945092bcffb47f379cb40e12292c2c077d9c
end