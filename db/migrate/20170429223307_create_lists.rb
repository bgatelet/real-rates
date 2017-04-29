class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists, id: :uuid do |t|
      t.references :user, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
