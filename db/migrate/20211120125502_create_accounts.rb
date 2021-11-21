class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.references :ledger, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
