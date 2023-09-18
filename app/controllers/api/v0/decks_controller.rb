class Api::V0::DecksController < ApplicationController
  before_action :logged_in?
  before_action :set_deck, only: [:show, :update, :destroy]

  def create
    user = User.find_by(id: session[:user_id])

    deck = user.decks.build(deck_params)
    if deck.save
      render json: deck, status: :created
    else
      render json: deck.errors, status: :unprocessable_entity
    end
  end

  def update
    if @deck.update(deck_params)
      render json: @deck, status: :ok
    else
      render json: { error: "Invalid" }, status: :unprocessable_entity
    end
  end

  def destroy
    # deck = Deck.find(params[:id])
    @deck.destroy
    head :no_content
  end

  def index
    user = User.find_by(id: session[:user_id])
    decks = user.decks.all

    render json: decks, status: :ok, content_type: 'application/json'
  end

  def show
    begin 
      # deck = Deck.find(params[:id])
      render json: @deck, status: :ok, content_type: 'application/json'
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Deck not found" }, status: :not_found, content_type: 'application/json'
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
  end

  def remove_card
    begin
      deck = Deck.find(params[:deck_id])
      deck.remove_card(params[:list], params[:card])
      deck.save
      render json: deck, status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Deck not found" }, status: :not_found
    end
  end

  private

  def set_deck
    begin
    @deck = Deck.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { error: "Deck not found" }, status: :not_found
    end
  end

  def deck_params
    params.require(:deck).permit(:name)
  end
end
