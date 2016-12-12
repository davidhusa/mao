require 'test_helper'

class GridCellsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grid_cell = grid_cells(:one)
  end

  test "should get index" do
    get grid_cells_url
    assert_response :success
  end

  test "should get new" do
    get new_grid_cell_url
    assert_response :success
  end

  test "should create grid_cell" do
    assert_difference('GridCell.count') do
      post grid_cells_url, params: { grid_cell: { description: @grid_cell.description, grid_row_id: @grid_cell.grid_row_id, position: @grid_cell.position } }
    end

    assert_redirected_to grid_cell_url(GridCell.last)
  end

  test "should show grid_cell" do
    get grid_cell_url(@grid_cell)
    assert_response :success
  end

  test "should get edit" do
    get edit_grid_cell_url(@grid_cell)
    assert_response :success
  end

  test "should update grid_cell" do
    patch grid_cell_url(@grid_cell), params: { grid_cell: { description: @grid_cell.description, grid_row_id: @grid_cell.grid_row_id, position: @grid_cell.position } }
    assert_redirected_to grid_cell_url(@grid_cell)
  end

  test "should destroy grid_cell" do
    assert_difference('GridCell.count', -1) do
      delete grid_cell_url(@grid_cell)
    end

    assert_redirected_to grid_cells_url
  end
end
