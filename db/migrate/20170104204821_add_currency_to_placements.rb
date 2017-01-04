class AddCurrencyToPlacements < ActiveRecord::Migration[5.0]
  def change
    add_column :placements, :currency, :integer
  end
end
