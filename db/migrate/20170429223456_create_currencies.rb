class CreateCurrencies < ActiveRecord::Migration[5.0]
  def change
    create_table :currencies, id: :uuid do |t|
      t.string :code
      t.decimal :rate

      t.timestamps
    end
  end
end
