class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :user_id, index: true
      t.integer :placement_id, index: true
      t.json :images

      t.timestamps
    end
  end
end
