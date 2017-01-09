class AddLocationToPlacements < ActiveRecord::Migration[5.0]
  def change
    add_column :placements, :formatted_address, :string
    add_column :placements, :street_number, :string
    add_column :placements, :route, :string
    add_column :placements, :locality, :string
    add_column :placements, :region, :string
    add_column :placements, :country, :string
    add_column :placements, :lat, :string
    add_column :placements, :lng, :string
  end
end
