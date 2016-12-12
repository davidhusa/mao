class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  before_action :set_card_type_options
  before_action :authenticate_user!

  def index
    @cards = Card.all
  end

  def show
  end

  def new
    @card = Card.new
  end

  def edit
  end

  def create
    byebug
    @card = Card.new(card_params)
    @card.user_id = current_user.id

    respond_to do |format|
      if @card.save && @card.update_list_items(params[:card][:list_items])
        format.html { redirect_to @card, notice: 'Card was successfully created.' }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @card.update(card_params) && @card.update_list_items(params[:card][:list_items])
        format.html { redirect_to @card, notice: 'Card was successfully updated.' }
        format.json { render :show, status: :ok, location: @card }
      else
        format.html { render :edit }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_card
      if params[:id] == params[:id].to_i.to_s
        @card = Card.find(params[:id])
      else
        @card = Card.find_by(:quick_ref, params[:id])
      end
    end

    def set_card_type_options
      @card_type_options = CardType.all.map {|ct| [ct.name, ct.id] }
    end

    def card_params
      params.require(:card).permit(:name, :card_type_id, :description, :quote, :cost, :quick_ref, :max_grid_width, :list_items)
    end

    def list_item_params

    end
end
