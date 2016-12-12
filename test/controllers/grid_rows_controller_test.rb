require 'test_helper'

class GridRowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grid_row = grid_rows(:one)
  end

  test "should get index" do
    get grid_rows_url
    assert_response :success
  end

  test "should get new" do
    get new_grid_row_url
    assert_response :success
  end

  test "should create grid_row" do
    assert_difference('GridRow.count') do
      post grid_rows_url, params: { grid_row: { card_id: @grid_row.card_id, header: @grid_row.header, position: @grid_row.position, width: @grid_row.width } }
    end

    assert_redirected_to grid_row_url(GridRow.last)
  end

  test "should show grid_row" do
    get grid_row_url(@grid_row)
    assert_response :success
  end

  test "should get edit" do
    get edit_grid_row_url(@grid_row)
    assert_response :success
  end

  test "should update grid_row" do
    patch grid_row_url(@grid_row), params: { grid_row: { card_id: @grid_row.card_id, header: @grid_row.header, position: @grid_row.position, width: @grid_row.width } }
    assert_redirected_to grid_row_url(@grid_row)
  end

  test "should destroy grid_row" do
    assert_difference('GridRow.count', -1) do
      delete grid_row_url(@grid_row)
    end

    assert_redirected_to grid_rows_url
  end
end
