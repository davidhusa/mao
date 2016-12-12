class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.references :card_type, foreign_key: true
      t.text :description
      t.text :quote
      t.integer :cost
      t.string :quick_ref
      t.integer :max_grid_width

      t.timestamps
    end
  end
end
