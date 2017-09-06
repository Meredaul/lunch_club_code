class CreateBalances < ActiveRecord::Migration[5.0]
  def change
    create_table :balances do |t|
      t.integer :amount
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
