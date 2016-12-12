class GridRowsController < ApplicationController
  before_action :set_grid_row, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /grid_rows
  # GET /grid_rows.json
  def index
    @grid_rows = GridRow.all
  end

  # GET /grid_rows/1
  # GET /grid_rows/1.json
  def show
  end

  # GET /grid_rows/new
  def new
    @grid_row = GridRow.new
  end

  # GET /grid_rows/1/edit
  def edit
  end

  # POST /grid_rows
  # POST /grid_rows.json
  def create
    @grid_row = GridRow.new(grid_row_params)

    respond_to do |format|
      if @grid_row.save
        format.html { redirect_to @grid_row, notice: 'Grid row was successfully created.' }
        format.json { render :show, status: :created, location: @grid_row }
      else
        format.html { render :new }
        format.json { render json: @grid_row.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grid_rows/1
  # PATCH/PUT /grid_rows/1.json
  def update
    respond_to do |format|
      if @grid_row.update(grid_row_params)
        format.html { redirect_to @grid_row, notice: 'Grid row was successfully updated.' }
        format.json { render :show, status: :ok, location: @grid_row }
      else
        format.html { render :edit }
        format.json { render json: @grid_row.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grid_rows/1
  # DELETE /grid_rows/1.json
  def destroy
    @grid_row.destroy
    respond_to do |format|
      format.html { redirect_to grid_rows_url, notice: 'Grid row was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   def set_grid_row
      @grid_row = GridRow.find(params[:id])
    end

    def grid_row_params
      params.require(:grid_row).permit(:card_id, :width, :header, :position)
    end
end
