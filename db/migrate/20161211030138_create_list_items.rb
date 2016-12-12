class CreateListItems < ActiveRecord::Migration[5.0]
  def change
    create_table :list_items do |t|
      t.references :card, foreign_key: true
      t.text :description
      t.integer :position

      t.timestamps
    end
  end
end
