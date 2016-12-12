class CreateGridCells < ActiveRecord::Migration[5.0]
  def change
    create_table :grid_cells do |t|
      t.references :grid_row, foreign_key: true
      t.text :description
      t.integer :position

      t.timestamps
    end
  end
end
