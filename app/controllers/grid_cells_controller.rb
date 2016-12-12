class GridCellsController < ApplicationController
  before_action :set_grid_cell, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /grid_cells
  # GET /grid_cells.json
  def index
    @grid_cells = GridCell.all
  end

  # GET /grid_cells/1
  # GET /grid_cells/1.json
  def show
  end

  # GET /grid_cells/new
  def new
    @grid_cell = GridCell.new
  end

  # GET /grid_cells/1/edit
  def edit
  end

  # POST /grid_cells
  # POST /grid_cells.json
  def create
    @grid_cell = GridCell.new(grid_cell_params)

    respond_to do |format|
      if @grid_cell.save
        format.html { redirect_to @grid_cell, notice: 'Grid cell was successfully created.' }
        format.json { render :show, status: :created, location: @grid_cell }
      else
        format.html { render :new }
        format.json { render json: @grid_cell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grid_cells/1
  # PATCH/PUT /grid_cells/1.json
  def update
    respond_to do |format|
      if @grid_cell.update(grid_cell_params)
        format.html { redirect_to @grid_cell, notice: 'Grid cell was successfully updated.' }
        format.json { render :show, status: :ok, location: @grid_cell }
      else
        format.html { render :edit }
        format.json { render json: @grid_cell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grid_cells/1
  # DELETE /grid_cells/1.json
  def destroy
    @grid_cell.destroy
    respond_to do |format|
      format.html { redirect_to grid_cells_url, notice: 'Grid cell was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_grid_cell
      @grid_cell = GridCell.find(params[:id])
    end

    def grid_cell_params
      params.require(:grid_cell).permit(:grid_row_id, :description, :position)
    end
end
