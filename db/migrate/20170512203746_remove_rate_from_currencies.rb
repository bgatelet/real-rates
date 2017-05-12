class RemoveRateFromCurrencies < ActiveRecord::Migration[5.0]
  def change
    remove_column :currencies, :rate
  end
end
