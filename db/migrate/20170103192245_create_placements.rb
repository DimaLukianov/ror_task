class CreatePlacements < ActiveRecord::Migration[5.0]
  def change
    create_table :placements do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
