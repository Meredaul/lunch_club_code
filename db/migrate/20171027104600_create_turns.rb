class CreateTurns < ActiveRecord::Migration[5.0]
  def change
    create_table :turns do |t|
      t.integer :points
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
