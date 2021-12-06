class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.references :ledger, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.references :subcategory, null: false, foreign_key: true
      t.date :date
      t.string :info
      t.boolean :cleared
      t.boolean :ttype
      t.decimal :value
      t.integer :installments
      t.boolean :subscription

      t.timestamps
    end
  end
end
