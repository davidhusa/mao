json.extract! grid_cell, :id, :grid_row_id, :description, :position, :created_at, :updated_at
json.url grid_cell_url(grid_cell, format: :json)