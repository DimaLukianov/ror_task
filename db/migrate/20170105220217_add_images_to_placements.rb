class AddImagesToPlacements < ActiveRecord::Migration[5.0]
  def change
    add_column :placements, :images, :json
  end
end
