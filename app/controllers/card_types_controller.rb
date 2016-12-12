class CardTypesController < ApplicationController
  before_action :set_card_type, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @card_types = CardType.all
  end

  def show
  end

  def new
    @card_type = CardType.new
  end

  def edit
  end

  def create
    @card_type = CardType.new(card_type_params)

    respond_to do |format|
      if @card_type.save
        format.html { redirect_to @card_type, notice: 'Card type was successfully created.' }
        format.json { render :show, status: :created, location: @card_type }
      else
        format.html { render :new }
        format.json { render json: @card_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @card_type.update(card_type_params)
        format.html { redirect_to @card_type, notice: 'Card type was successfully updated.' }
        format.json { render :show, status: :ok, location: @card_type }
      else
        format.html { render :edit }
        format.json { render json: @card_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @card_type.destroy
    respond_to do |format|
      format.html { redirect_to card_types_url, notice: 'Card type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_card_type
      @card_type = CardType.find(params[:id])
    end

    def card_type_params
      params.require(:card_type).permit(:name, :description)
    end
end
