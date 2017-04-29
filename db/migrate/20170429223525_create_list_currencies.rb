class CreateListCurrencies < ActiveRecord::Migration[5.0]
  def change
    create_table :list_currencies, id: :uuid do |t|
      t.references :list, type: :uuid, foreign_key: true
      t.references :currency, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
