class CreateGridRows < ActiveRecord::Migration[5.0]
  def change
    create_table :grid_rows do |t|
      t.references :card, foreign_key: true
      t.integer :width
      t.boolean :header
      t.integer :position

      t.timestamps
    end
  end
end
