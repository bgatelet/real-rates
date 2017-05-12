class AddBaseRateToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :base_currency, :string, default: "USD"
  end
end
